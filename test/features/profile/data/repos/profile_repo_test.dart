import 'package:chefio_app/core/api/end_ponits.dart';
import 'package:chefio_app/core/errors/api_failure.dart';
import 'package:chefio_app/features/profile/data/models/chef_follower_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_following_model.dart';
import 'package:chefio_app/features/profile/data/models/chef_liked_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/chef_profile_recipe_model.dart';
import 'package:chefio_app/features/profile/data/models/profile_model/profile_model.dart';
import 'package:chefio_app/features/profile/data/repos/profile_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/mock_api_consumer.dart';
import '../test_data/profile_expected_response_helper.dart';

void main() {
  group(
    'profile repo - ',
    () {
      late MockApiConsumer mockApiConsumer;
      late ProfileRepoImpl profileRepoImpl;
      const String chefId = '123';
      const int page = 1;
      const int limit = 10;
      setUpAll(() {
        mockApiConsumer = MockApiConsumer();
        profileRepoImpl = ProfileRepoImpl(apiConsumer: mockApiConsumer);
      });
      group(
        'fetch profile with initial recipes  method ',
        () {
          test(
              'Given Profile Repo when call fetch Profile with initial recipes request then it should return a profile model ',
              () async {
            final Map<String, dynamic> expectedResponse =
                ProfileExpectedResponseHelper.fetchProfileWithInitialRecipes;

            // Arrang
            when(() => mockApiConsumer.get(
                  EndPoints.getChefProfileEndpoint(chefId),
                  queryParameters: any(named: 'queryParameters'),
                )).thenAnswer((_) async => expectedResponse);
            // Act
            final result =
                await profileRepoImpl.fetchProfileWithInitialChefRecipes(
              chefId: chefId,
              page: page,
              limit: limit,
            );
            //Assert
            result.fold(
              (failure) => fail("Expected a ProfileModel, got Failure"),
              (profileModel) {
                expect(profileModel, isA<ProfileModel>());
              },
            );
          });
          test(
            'Given Profile Repo when call fetch Profile with initial recipes request  then it should return status code 400 and api failure',
            () async {
              final Map<String, dynamic> expectedResponse =
                  ProfileExpectedResponseHelper.fetchProfileWithInitialRecipes;

              when(() => mockApiConsumer.get(
                    EndPoints.getChefProfileEndpoint(chefId),
                    queryParameters: any(named: 'queryParameters'),
                  )).thenAnswer(
                (_) async => Response(
                  data: expectedResponse,
                  requestOptions: RequestOptions(path: ''),
                  statusCode: 400,
                ),
              );

              final result =
                  await profileRepoImpl.fetchProfileWithInitialChefRecipes(
                chefId: chefId,
                page: page,
                limit: limit,
              );
              result.fold(
                (failure) => expect(failure, isA<ApiFailure>()),
                (profileModel) {
                  fail("Expected an ApiFailure, got ProfileModel");
                },
              );
            },
          );
        },
      );

      group(
        'fetch profile chef  recipes  method ',
        () {
          test(
            'Given Profile Repo when call fetch Profile Chef  recipes request  then it should return List<ProfileChefRecipeModel> ',
            () async {
              final Map<String, dynamic> expectedResponse =
                  ProfileExpectedResponseHelper.fetchChefLikedRecipes;

              //Arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefRecipesEndpoint(chefId),
                  queryParameters: any(named: 'queryParameters'),
                ),
              ).thenAnswer(
                (invocation) async => expectedResponse,
              );
              //Act
              final result = await profileRepoImpl.fetchChefRecipes(
                chefId: chefId,
                page: page,
                limit: limit,
              );

              //Assert
              result.fold(
                (failure) => fail(
                  'Expected a List of ProfileChefRecipeModel but got api failure',
                ),
                (chefRecipes) =>
                    expect(chefRecipes, isA<List<ChefProfileRecipeModel>>()),
              );
            },
          );
          test(
            'Given Profile Repository when fetchChefRecipes method then it should return status code 400 and api failure',
            () async {
              const String chefId = '123';
              final int page = 1;
              final int limit = 10;

              //arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefRecipesEndpoint(chefId),
                  queryParameters: any(named: 'queryParameters'),
                ),
              ).thenAnswer(
                (invocation) async => Response(
                  requestOptions: RequestOptions(),
                  data: ProfileExpectedResponseHelper.fetchChefLikedRecipes,
                  statusCode: 400,
                ),
              );

              //act
              final result = await profileRepoImpl.fetchChefRecipes(
                chefId: chefId,
                page: page,
                limit: limit,
              );
              result.fold(
                (failure) => expect(failure, isA<ApiFailure>()),
                (chefRecipes) => fail(
                  'Expected ApiFailure but got chefRecipes',
                ),
              );
            },
          );
        },
      );

      group(
        'fetch profile chef liked recipes',
        () {
          test(
            'Given profile repository when fetch profile chef liked recipes then it should return a profile  liked recipe model  ',
            () async {
              final Map<String, dynamic> expectedResponse =
                  ProfileExpectedResponseHelper.fetchChefLikedRecipes;

              //Arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefLikedRecipesEndpoint(chefId),
                  queryParameters: any(named: 'queryParameters'),
                ),
              ).thenAnswer(
                (invocation) async => expectedResponse,
              );
              //Act
              final result = await profileRepoImpl.fetchChefLikedRecipes(
                chefId: chefId,
                page: page,
                limit: limit,
              );

              //Assert
              result.fold(
                (failure) => fail(
                  'Expected a List of ProfileChefLikedModel but got api failure',
                ),
                (likedRecipes) =>
                    expect(likedRecipes, isA<List<ChefLikedRecipeModel>>()),
              );
            },
          );
          test(
            'Given Profile Repository when call fetchChefLikedRecipes method then it should return status code 400 and api failure',
            () async {
              const String chefId = '123';
              final int page = 1;
              final int limit = 10;

              //arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefLikedRecipesEndpoint(chefId),
                  queryParameters: any(named: 'queryParameters'),
                ),
              ).thenAnswer(
                (invocation) async => Response(
                  requestOptions: RequestOptions(),
                  data: ProfileExpectedResponseHelper.fetchChefLikedRecipes,
                  statusCode: 400,
                ),
              );

              //act
              final result = await profileRepoImpl.fetchChefLikedRecipes(
                chefId: chefId,
                page: page,
                limit: limit,
              );
              result.fold(
                (failure) => expect(failure, isA<ApiFailure>()),
                (chefRecipes) => fail(
                  'Expected ApiFailure but got chefRecipes',
                ),
              );
            },
          );
        },
      );

      group(
        'fetch Chef Following Method',
        () {
          test(
            'Given profile repository when call  fetchChefFollowing  request   then it should return a List of ChefFollowingModel  ',
            () async {
              final Map<String, dynamic> expectedResponse =
                  ProfileExpectedResponseHelper.fetchChefFollowing;

              //Arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefFollowingEndpoint(chefId),
                ),
              ).thenAnswer(
                (invocation) async => expectedResponse,
              );
              //Act
              final result = await profileRepoImpl.fetchChefFollowings(
                chefId: chefId,
              );

              //Assert
              result.fold(
                (failure) => fail(
                  'Expected a List of ChefFollowingModel but got api failure',
                ),
                (likedRecipes) =>
                    expect(likedRecipes, isA<List<ChefFollowingModel>>()),
              );
            },
          );
          test(
            'Given Profile Repository when call fetchChefFollowing method then it should return status code 400 and api failure',
            () async {
              //arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefFollowingEndpoint(chefId),
                ),
              ).thenAnswer(
                (invocation) async => Response(
                  requestOptions: RequestOptions(),
                  data: ProfileExpectedResponseHelper.fetchChefLikedRecipes,
                  statusCode: 400,
                ),
              );

              //act
              final result = await profileRepoImpl.fetchChefFollowings(
                chefId: chefId,
              );
              result.fold(
                (failure) => expect(failure, isA<ApiFailure>()),
                (chefRecipes) => fail(
                  'Expected ApiFailure but got chefFollowings',
                ),
              );
            },
          );
        },
      );
      group(
        'fetch Chef Follwers Method',
        () {
          test(
            'Given profile repository when call  fetchChefFollowers  request   then it should return a List of ChefFollowersModel  ',
            () async {
              final Map<String, dynamic> expectedResponse =
                  ProfileExpectedResponseHelper.fetchChefFollowers;

              //Arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefFollowersEndpoint(chefId),
                ),
              ).thenAnswer(
                (invocation) async => expectedResponse,
              );
              //Act
              final result = await profileRepoImpl.fetchChefFollowers(
                chefId: chefId,
              );

              //Assert
              result.fold(
                (failure) => fail(
                  'Expected a List of ChefFollowerModel but got api failure',
                ),
                (likedRecipes) =>
                    expect(likedRecipes, isA<List<ChefFollowerModel>>()),
              );
            },
          );
          test(
            'Given Profile Repository when call fetchChefFollowing method then it should return status code 400 and api failure',
            () async {
              //arrange
              when(
                () => mockApiConsumer.get(
                  EndPoints.getChefFollowersEndpoint(chefId),
                ),
              ).thenAnswer(
                (invocation) async => Response(
                  requestOptions: RequestOptions(),
                  data: ProfileExpectedResponseHelper.fetchChefFollowers,
                  statusCode: 400,
                ),
              );

              //act
              final result = await profileRepoImpl.fetchChefFollowers(
                chefId: chefId,
              );
              result.fold(
                (failure) => expect(failure, isA<ApiFailure>()),
                (chefRecipes) => fail(
                  'Expected ApiFailure but got chefFollowers',
                ),
              );
            },
          );
        },
      );
    },
  );
}
