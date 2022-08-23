import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import 'package:test_api_app/provider/login_provider.dart';
import 'package:test_api_app/provider/sign_up_provider.dart';
import 'package:test_api_app/repository/auth_repository.dart';
import 'package:test_api_app/screens/login_screen.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  final MockAuthRepository mockAuthRepository = MockAuthRepository();

  void mockAuthRepositoryAction() {
    when(
      () => mockAuthRepository.login(
        email: 'ola@gmail.com',
        password: 'Test123456',
      ),
    ).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 2));

        return {};
      },
    );

    when(
      () => mockAuthRepository.signUpUser(
        email: '',
        password: '',
        fullName: '',
        phone: '',
        username: '',
      ),
    ).thenAnswer(
      (_) async {
        await Future.delayed(const Duration(seconds: 2));

        return {};
      },
    );
  }

  List<ChangeNotifierProvider> blocList() {
    return [
      ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(mockAuthRepository),
      ),
      ChangeNotifierProvider<SignUpProvider>(
        create: (context) => SignUpProvider(mockAuthRepository),
      ),
    ];
  }

  Widget createAppUnderTest() {
    return MultiProvider(
      providers: blocList(),
      child: MaterialApp(
        title: 'API Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
      ),
    );
  }

  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    mockAuthRepositoryAction();

    final emailForm = find.byType(TextFormField).first;
    final passwordForm = find.byType(TextFormField).last;

    final loginButton = find.byType(TextButton).first;

    testWidgets('Test Login Form', (tester) async {
      await tester.pumpWidget(createAppUnderTest());

      await tester.pumpAndSettle();

      await tester.enterText(emailForm, 'ola@gmail.com');
      await waiter();

      await tester.enterText(passwordForm, 'Test123456');
      await waiter();

      await tester.enterText(emailForm, '');
      await waiter();

      await tester.enterText(passwordForm, '');
      await waiter();
    });

    testWidgets('Test Loading Button Showing', (tester) async {
      await tester.pumpWidget(createAppUnderTest());

      await tester.pumpAndSettle();

      await tester.enterText(emailForm, 'ola@gmail.com');
      await waiter();

      await tester.enterText(passwordForm, 'Test123456');
      await waiter();

      await tester.pumpAndSettle();
      await waiter();

      await tester.tap(loginButton);

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await waiterLong();
    });

    testWidgets('Test SnackBar Shows At Successfully Loading', (tester) async {
      await tester.pumpWidget(createAppUnderTest());

      await tester.pumpAndSettle();

      await tester.enterText(emailForm, 'ola@gmail.com');
      await waiter();

      await tester.enterText(passwordForm, 'Test123456');
      await waiter();

      await tester.pumpAndSettle();
      await waiter();

      await tester.tap(loginButton);

      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.text('User Login Successfully!'), findsOneWidget);

      await waiterLong();
    });
  });
}

Future<void> waiter() async =>
    await Future.delayed(const Duration(milliseconds: 500));

Future<void> waiterLong() async =>
    await Future.delayed(const Duration(seconds: 2));
