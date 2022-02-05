import 'package:flutter/material.dart';
import 'package:trade_me_gui/controllers/login.dart';
import 'package:trade_me_gui/main.dart';
import 'package:trade_me_gui/services/backend.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum MemberType{ tradesman, contractor }

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  MemberType memberType = MemberType.tradesman;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Color isMemberTypeOf(MemberType mt) => memberType == mt ? Colors.blueAccent : Colors.grey;

  @override
  Widget build(BuildContext context) {
    final LoginController _loginController = LoginController(BackEndService(), context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/login_background.jpg"))),
          ),
          Center(child: SizedBox(
            width: 400,
            height: 400,
            child: Card(
              color: Colors.red,
              elevation: 18,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("T r a d e M E", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 30),),
                      Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: "Email address",
                              border: OutlineInputBorder()),),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder()),),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            TextButton.icon(onPressed: (){
                              setState(() {
                                memberType = MemberType.tradesman;
                              });
                            }, icon: Icon(Icons.group, color: isMemberTypeOf(MemberType.tradesman),), label: Text("Tradesman", style: TextStyle(fontWeight: FontWeight.bold, color: isMemberTypeOf(MemberType.tradesman)),)),
                            TextButton.icon(onPressed: (){
                              setState(() {
                                memberType = MemberType.contractor;
                              });
                            }, icon: Icon(Icons.face, color: isMemberTypeOf(MemberType.contractor),), label: Text("Contractor", style: TextStyle(fontWeight: FontWeight.bold, color: isMemberTypeOf(MemberType.contractor)))),
                          ],)
                        ],
                      ),
                      ElevatedButton(onPressed: () {
                        _loginController.authenticate(emailController, passwordController, memberType);
                      }, child: const Text("OK"))
                    ],),
                ),
              ),
            ),
          ),)
        ],
      ),);
  }
}
