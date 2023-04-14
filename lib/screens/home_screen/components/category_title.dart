import 'package:flutter/material.dart';


class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key, required this.categoryTitle});
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Text(categoryTitle, style: Theme.of(context).textTheme.displayMedium);
  }
}