import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materi_api/api_data_source.dart';
import 'package:materi_api/halaman_detail.dart';
import 'package:materi_api/user_model.dart';
import 'package:materi_api/user_model.dart';

class halamanDetail extends StatelessWidget {
  final Data user;
  const halamanDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            Image(image: NetworkImage(user.avatar!)),
            Text(user.firstName! + " " + user.lastName!),
            Text(user.email!),
          ],
        ),
      ),
    );
  }
}
