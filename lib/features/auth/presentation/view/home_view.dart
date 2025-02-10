import 'dart:developer';

import 'package:chefio_app/core/api/api_keys.dart';
import 'package:chefio_app/core/utils/app_router.dart';
import 'package:chefio_app/core/utils/secure_storage_helper.dart';
import 'package:chefio_app/core/utils/service_locator.dart';
import 'package:chefio_app/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(),
            CustomTextButton(
                onPressed: () {
                  context.go(AppRouter.kLoginView);
                },
                child: Text(
                  "go to login view ",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 12,
            ),
            CustomTextButton(
              onPressed: () async {
                String? token = await getIt<SecureStorageHelper>()
                    .getString(key: ApiKeys.token);

                log("token : $token");
              },
              child: Text(
                "print token",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () async {
                String? token = await getIt<SecureStorageHelper>()
                    .getString(key: ApiKeys.token);

                log("token : $token");
              },
              child: Text(
                "print token",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
    );
  }
}
