import 'package:flutter/material.dart';
import 'package:project/screens/screens.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hi, Edward',
                style: Theme.of(context).textTheme.displayMedium),
            const CircleAvatar(
              child: Text('E'),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        TextField(
          controller: inputController,
          onSubmitted: (v) => Navigator.of(context).pushNamed(
              SearchMovieScreen.routesName,
              arguments: inputController.text),
          decoration: InputDecoration(
            hintText: 'Search your movie',
            prefixIcon: const Icon(Icons.search),
            border: const OutlineInputBorder()
                .copyWith(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ],
    );
  }
}
