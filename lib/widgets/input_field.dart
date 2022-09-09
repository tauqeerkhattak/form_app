import 'package:flutter/material.dart';
import 'package:form_app/utils/app_colors.dart';
import 'package:form_app/widgets/widgets_uril.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    this.onTap,
    this.placeHolder,
    this.readOnly,
    this.icon,
    this.vertical,
    this.horizontal,
    this.lines,
    this.controller,
    this.validator,
    this.inputType,
    this.label,
  }) : super(key: key);

  final String? placeHolder;
  final String? label;
  final Widget? icon;
  final bool? readOnly;
  final double? vertical, horizontal;
  final VoidCallback? onTap;
  final int? lines;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: vertical ?? 1.0,
        horizontal: horizontal ?? 1.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              '$label',
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (label != null) WidgetsUtil.spaceV10,
          TextFormField(
            controller: controller,
            validator: validator,
            readOnly: readOnly ?? false,
            onTap: onTap,
            keyboardType: inputType,
            maxLines: lines ?? 1,
            style: const TextStyle(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              // constraints: const BoxConstraints(
              //   minHeight: 60,
              //   maxHeight: 60,
              // ),

              hintText: placeHolder.toString(),
              prefixIcon: icon,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: BorderSide(
                  color: AppColors.primary.withOpacity(0.4),
                  width: 2.0,
                ),
                // borderSide: BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18.0),
                borderSide: BorderSide(
                  color: Colors.redAccent.withOpacity(0.4),
                  width: 2.0,
                ),
              ),
              // focusedErrorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(18.0),
              //   borderSide: const BorderSide(
              //     color: Colors.red,
              //     width: 2.0,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
