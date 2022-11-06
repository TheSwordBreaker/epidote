import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
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
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Password"),
                        obscureText: true,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 20.0),
                        child: TextButton(
                          style: flatButtonStyle,
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
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
