import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_core_project/data/model/user/user_response.dart';
import 'package:mvvm_core_project/data/repository/user/user_repository_imp.dart';
import 'package:mvvm_core_project/domain/model/user_dto.dart';
import 'package:mvvm_core_project/utilities/failure.dart';

import '../../helper/mock_helper_test.mocks.dart';

void main() {
  late MockUserService userService;
  late UserRepositoryImp userRepositoryImp;

  setUp(() {
    userService = MockUserService();
    userRepositoryImp = UserRepositoryImp(userService: userService);
  });

  group("UserRepositoryImp Test Cases", () {
    var mockUserResponse = UserResponse.init(
      page: 1,
      totalPage: 1,
      data: [
        UserDataResponse(
          id: 7,
          email: "michael.lawson@reqres.in",
          firstname: "Michael",
          lastname: "Lawson",
          avatar: "https://reqres.in/img/faces/7-image.jpg",
        ),
        UserDataResponse(
          id: 9,
          email: "lindsay.ferguson@reqres.in",
          firstname: "Lindsay",
          lastname: "Ferguson",
          avatar: "https://reqres.in/img/faces/8-image.jpg",
        ),
      ],
    );

    var expectedResult = [
      UserDTO(
        email: "michael.lawson@reqres.in",
        firstName: "Michael",
        lastName: "Lawson",
        avatar: "https://reqres.in/img/faces/7-image.jpg",
      ),
      UserDTO(
        email: "lindsay.ferguson@reqres.in",
        firstName: "Lindsay",
        lastName: "Ferguson",
        avatar: "https://reqres.in/img/faces/8-image.jpg",
      ),
    ];

    test("Get Users Throw Error.", () async {
      when(userService.fetchUsers()).thenThrow(Exception());
      var result = await userRepositoryImp.getUers();

      verify(userService.fetchUsers());
      expect(result, equals(const Left(ServerFailure("Something went wrong!"))));
      // expect(
      //     result,
      //     isA<Left<Failure, List<UserDTO>>>()
      // .having((p0) => p0.value, 'value', equals(const ServerFailuer("Failed to get users"))));
    });

    test("Get Users Successfully.", () async {
      when(userService.fetchUsers()).thenAnswer((_) async => mockUserResponse);
      var result = await userRepositoryImp.getUers();

      verify(userService.fetchUsers());
      expect(result, isA<Right<Error, List<UserDTO>>>().having((p0) => p0.value, "value", equals(expectedResult)));
    });
  });
}
