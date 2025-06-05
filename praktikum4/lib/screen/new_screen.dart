import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  final String payload;

  const NewScreen({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifikasi Diklik")),
      body: Center(child: Text("Payload: $payload")),
    );
  }
}
