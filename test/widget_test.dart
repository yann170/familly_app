// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/*

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:familly_apps/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
*/


import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import '../lib/features/ auth/ data/datasources/auth_remote_datasource.dart';

void main() {
  test('Doit retourner un UserModel quand le login réussit', () async {
    // 1. On configure Dio comme dans ton injection_container
    final dio = Dio(BaseOptions(baseUrl: 'https://reunion-backend-eu5v.onrender.com/v1/'));
    final dataSource = AuthRemoteDataSource(dio);

    // 2. On appelle la méthode directement (sans UI !)
    final result = await dataSource.login('admin@testmail.com', 'reunion');

    // 3. On vérifie si ça marche
    expect(result.email, 'test@email.com');
    print('Succès ! Nom de l\'utilisateur : ${result.email}');
  });
}