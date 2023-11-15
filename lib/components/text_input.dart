import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AppTextInput extends StatelessWidget {
  final EdgeInsets margin;
  const AppTextInput({
    Key? key,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.search,
              size: 32.0,
              color: Colors.grey,
            ),
          ),
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
