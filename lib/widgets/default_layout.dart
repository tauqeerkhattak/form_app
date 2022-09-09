import 'package:flutter/material.dart';
import 'package:form_app/utils/app_colors.dart';
import 'package:form_app/widgets/custom_text.dart';

class DefaultLayout extends StatelessWidget {
  final String? title;
  final Widget child;
  const DefaultLayout({
    super.key,
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null
            ? CustomText(
                text: title!,
                size: 30,
                color: AppColors.primary,
                weight: FontWeight.w500,
              )
            : null,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
