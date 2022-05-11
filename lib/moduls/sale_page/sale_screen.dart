import 'package:flutter/material.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwaWcQEXT05zeyvG-v-vvUb2HxKg8EqR1Wjg&usqp=CAU"),
                fit: BoxFit.cover),
          ),
          child: Text('') // Foreground widget here
      ),
    );
  }
}
