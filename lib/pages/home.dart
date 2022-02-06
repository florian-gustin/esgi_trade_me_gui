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
                    setState(() async {
                      users = await _homeController.getAll();
                    });
                  },
                  child: const Text("Get all users"))),
          const SizedBox(
            height: 250,
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.email),
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
