import 'package:bloc/bloc.dart';
import 'package:chefio_app/features/otp/data/models/otp_reason.dart';
import 'package:chefio_app/features/otp/data/repos/otp_repo.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo _otpRepo;
  final OtpReason otpReason;
  OtpCubit({
    required OtpRepo otpRepo,
    required this.otpReason,
  })  : _otpRepo = otpRepo,
        super(OtpInitial());

  Future<void> sendVerificationCode() async {
    log('🟢 sendVerificationCode started');
    log('🔹 otpReason is: $otpReason');
    log('🔹 sendCodeOnOpen = ${otpReason.sendCodeOnOpen}');

    if (!otpReason.sendCodeOnOpen) {
      emit(
        SendOtpSuccess(),
      );
      return;
    }
    emit(OtpLoading());
    var otpResult = await _otpRepo.sendVerificationCode(otpReason: otpReason);
    otpResult.fold(
      (failure) => emit(
        SendOtpFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (_) => emit(
        SendOtpSuccess(),
      ),
    );
  }

  void showSendAgain() => emit(ShowSendAgain());

  Future<void> resendVerificationCode() async {
    emit(OtpLoading());
    var otpResult = await _otpRepo.sendVerificationCode(otpReason: otpReason);
    otpResult.fold(
      (failure) => emit(
        SendOtpFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (_) => emit(
        SendOtpSuccess(),
      ),
    );
  }

  Future<void> verfiyVerificationCode({required int code}) async {
    emit(OtpLoading());
    var otpResult = await _otpRepo.verifyVerificationCode(
      otpReason: otpReason,
      verificationCode: code,
    );

    otpResult.fold(
      (failure) => emit(
        VerifyOtpFailure(
          errorMessage: failure.errMsg,
          errorLocalizationKey: failure.localizaitonKey,
        ),
      ),
      (_) => emit(
        VerifyOtpSuccess(),
      ),
    );
  }
}
