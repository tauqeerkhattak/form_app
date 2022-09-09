import 'package:flutter/material.dart';
import 'package:form_app/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const FamilyRegistrationApp());
}

class FamilyRegistrationApp extends StatelessWidget {
  const FamilyRegistrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      getPages: Routes.pages,
    );
  }
}
