import 'package:flutter/material.dart';
import 'package:sch_mgt_system/constants/colors.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.only(left: 40.0, right: 5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: AppColors.white),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.black),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: AppColors.secondary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
