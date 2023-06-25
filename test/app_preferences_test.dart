import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_core_project/utilities/app_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockPerson {
  final String email;
  final String username;
  final String position;
  final String company;
  final double salary;
  final int yearOfWork;
  final bool isActive;

  MockPerson({
    required this.email,
    required this.username,
    required this.position,
    required this.company,
    required this.salary,
    required this.yearOfWork,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'position': position,
      'company': company,
      'salary': salary,
      'yearOfWork': yearOfWork,
      'isActive': isActive,
    };
  }

  factory MockPerson.fromJson(Map<String, dynamic> json) {
    return MockPerson(
      email: json['email'],
      username: json['username'],
      position: json['position'],
      company: json['company'],
      salary: json['salary'],
      yearOfWork: json['yearOfWork'],
      isActive: json['isActive'],
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  var faker = Faker();
  MockPerson person = MockPerson(
    email: faker.internet.email(),
    username: faker.person.name(),
    position: faker.job.title(),
    company: faker.company.name(),
    salary: 1500.50,
    yearOfWork: 5,
    isActive: true,
  );

  late AppPreferences appPreferences;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    Provider.debugCheckInvalidValueType = null; // Disable debug warnings
    final sharedPreferences = await SharedPreferences.getInstance();
    appPreferences = AppPreferences(sharedPreferences: sharedPreferences);
    await appPreferences.initialize();
  });

  tearDownAll(() async {
    await appPreferences.sharedPreferences.clear();
  });

  group("AppPreference", () {
    // Test case for initializing SharedPreferences
    test('Initialize SharedPreferences', () async {
      // SharedPreferences.setMockInitialValues({});
      expect(appPreferences.sharedPreferences, isNotNull);
    });

    test('Writing', () async {
      SharedPreferences.setMockInitialValues({});
      debugPrint("Email: ${person.email}");
      await Future.wait(<Future<bool>>[
        appPreferences.setString("fake_email", person.email),
        appPreferences.setString("fake_username", person.username),
        appPreferences.setDouble("fake_salary", person.salary),
        appPreferences.setInt("fake_year_of_work", person.yearOfWork),
        appPreferences.setBool("fake_is_active", person.isActive),
        appPreferences.setOject("fake_user", person.toJson()),
      ]);

      debugPrint("Getting Email: ${appPreferences.getString("fake_email")}");
    });

    test("Reading", () {
      SharedPreferences.setMockInitialValues({});
      expect(appPreferences.getString("fake_email"), person.email);
      expect(appPreferences.getString("fake_username"), person.username);
      expect(appPreferences.getDouble("fake_salary"), person.salary);
      expect(appPreferences.getInt("fake_year_of_work"), person.yearOfWork);
      expect(appPreferences.getBool("fake_is_active"), person.isActive);
      final json = appPreferences.getObject("fake_user");
      expect(json, isNotEmpty);
      expect(MockPerson.fromJson(json), allOf(isNotNull, isA<MockPerson>()));
    });

    test('Removing', () async {
      for (var key in [
        "fake_email",
        "fake_username",
        "fake_salary",
        "fake_year_of_work",
        "fake_is_active",
        "fake_user"
      ]) {
        await appPreferences.remove(key);
      }

      expect(appPreferences.getString("fake_email"), isNull);
      expect(appPreferences.getString("fake_username"), isNull);
      expect(appPreferences.getDouble("fake_salary"), isNull);
      expect(appPreferences.getInt("fake_year_of_work"), isNull);
      expect(appPreferences.getBool("fake_is_active"), isNull);
      expect(appPreferences.getObject("fake_user"), isNull);
    });
  });
}
