import 'package:flutter/material.dart';
import 'navbar_view.dart';

class ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Center(
        child: Text('Chat UPDATE Page'),
      ),
    );
  }
}