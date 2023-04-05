import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('E-commerce'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ },
        child: Icon(Icons.add),
      ),
    );
  }
}
