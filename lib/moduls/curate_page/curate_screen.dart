import 'package:flutter/material.dart';

class CurateScreen extends StatelessWidget {
  const CurateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1566890910598-c5768889e83e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aGluZHUlMjBnb2R8ZW58MHx8MHx8&w=1000&q=80"),
                fit: BoxFit.cover),
          ),
          child: Text('') // Foreground widget here
      ),
    );
  }
}
