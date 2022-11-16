import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    // foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  Future<void> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      // Navigator.pushNamed(context, '/');
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          child: Center(
            child: ListView(
              children: <Widget>[
                AppCard(
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Get All Health Data in App",
                        style: TextStyle(fontSize: 32.0),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                AppCard(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Email"),
                        controller: emailController,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Password"),
                        controller: passwordController,
                        obscureText: true,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButton(
                          style: flatButtonStyle,
                          onPressed: () {
                            // print(emailController.text);
                            // print(passwordController.text);
                            signIn(
                                emailController.text, passwordController.text);
                            // Navigator.pushNamed(context, '/');
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text("Login"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppCard extends StatefulWidget {
  final Widget child;
  final Border? borderStyle;
  final Color? boxShadowColor;

  const AppCard(
      {Key? key, required this.child, this.borderStyle, this.boxShadowColor})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppCardState createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: const EdgeInsets.all(20.0),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: widget.borderStyle ??
                  Border.all(color: Colors.black, width: 2),
            ),
            child: widget.child,
          ),
        )
      ],
    );
  }
}
