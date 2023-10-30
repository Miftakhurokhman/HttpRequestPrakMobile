import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materi_api/api_data_source.dart';
import 'package:materi_api/halaman_detail.dart';
import 'package:materi_api/user_model.dart';

class HalamanUsers extends StatelessWidget {
  const HalamanUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WasAp"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder(
          future: ApiDataSource.instance.loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Eror Boss");
            }
            if (snapshot.hasData) {
              UserModel users = UserModel.fromJson(snapshot.data!);
              return ListView.builder(
                  itemCount: users.data!.length,
                  itemBuilder: (context, index) {
                    var user = users.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(user.avatar!),
                      ),
                      title: Text(user.firstName! + " " + user.lastName!),
                      subtitle: Text("${user.email}"),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return halamanDetail(user: user);
                        }));
                      }
                    );
                  },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
      )
    );
  }
}
