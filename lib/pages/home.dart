import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trade_me_gui/controllers/home.dart';
import 'package:trade_me_gui/models/user.dart';
import 'package:trade_me_gui/services/aws_rds.dart';
import 'package:trade_me_gui/services/file_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<User> users = [];

  @override
  Widget build(BuildContext context) {
    final _homeController = HomeController(
        FileStorageService(), AmazonWebRDSService(Dio()), context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 50,
              onPressed: () {
                _homeController.exit();
              },
              icon: const Icon(
                Icons.exit_to_app_rounded,
              )),
          const SizedBox(
            height: 25,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/home_background.png"),
            radius: 125,
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    _homeController.addPhoto();
                  },
                  child: const Text("UPLOAD YOUR PHOTO"))),
          const SizedBox(
            height: 25,
          ),
          Center(
              child: ElevatedButton(
                  onPressed: ()  {
                   _homeController.getAll().then((value) {
                     setState(() {
                        users = value.reversed.toList();
                     });
                   });

                  },
                  child: const Text("Get latest logged users"))),
          const SizedBox(
            height: 250,
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(user.email),
                    Text(user.lastDate ?? ''),
                  ],),
                );
              },
              itemCount: users.length,
            ),
          ),
        ],
      ),
    );
  }
}
