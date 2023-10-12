import 'package:flutter/material.dart';
import 'package:menu_barcode_apps/app/constants/app_colors.dart';
import 'package:menu_barcode_apps/app/constants/icons.dart';

class AppTextInput extends StatelessWidget {
  const AppTextInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 2),
                color: Colors.black.withOpacity(.1))
          ]),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: getSvgImage(AppIcons.search,
                  height: 30, width: 30, color: Colors.grey)),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey.shade400),
          focusColor: AppColors.primaryOrange,
          contentPadding: const EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
