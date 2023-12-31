import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materi_api/user_model.dart';

class halamanDetail extends StatelessWidget {
  final Map<String, dynamic> detailData;
  const halamanDetail({super.key, required this.detailData});

  @override
  Widget build(BuildContext context) {
    final userData = detailData['data'];
    final user = Data.fromJson(userData);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            user.avatar != null
                ? Image(image: NetworkImage(user.avatar!))
                : Text("Image not found"),
            user.firstName != null && user.lastName != null
                ? Text(user.firstName! + " " + user.lastName!)
                : Text("Name not found"),
            user.email != null
                ? Text(user.email!)
                : Text("Email not found"),
          ],
        ),
      ),
    );
  }
}
