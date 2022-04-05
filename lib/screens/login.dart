import 'package:flutter/material.dart';
import 'package:tyler_todoapp/components/textFormField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Map data = {};
  final textInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height; //Get Device Height
    //final appBarHeight = AppBar.preferredSize.height; //Get Height of Title App Bar
    final statusBarHeight = MediaQuery.of(context).padding.top; //Get height of status bar
    //To Get Actual app height = screenHeight - appBarHeight - statusBarHeight
    final screenWidth = MediaQuery.of(context).size.width; //Get actual width of device
    final loginHeight = screenHeight * 0.55 - statusBarHeight;
    //This code above only works in Scaffold

    // ModalRoute.of(context).settings.arguments;
    // data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map; //To avoid rerunning buildcontext defaulting to original location.
    // // data.isNotEmpty
    // print(data);
    // //set background
    // String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    // Color?bgColor = data['isDaytime'] ? Colors.lightBlueAccent[400] : Colors.indigo[900];

    //https://github.com/MonsieurZbanowanYY/Login-UI-Flutter Login UI Flutter



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
            title: Text('Notes Tracker'),
            centerTitle: true,
            toolbarHeight: 40.0,
            elevation: 0,
        ),
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.2,
                0.6,
                0.9,
              ],
              colors: [
                Colors.greenAccent,
                Colors.blue,
                Colors.deepPurple
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              //width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              width: screenWidth,
              height: loginHeight,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text('Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  formField(controller: textInput, hint: 'Username', icon: Icons.account_circle_rounded),
                  const SizedBox(height: 15),
                  formField(controller: textInput, hint: 'Password', icon: Icons.vpn_key_rounded),
                  const SizedBox(height: 15),
                  IntrinsicWidth( //For all buttons to have same width
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:<Widget>[
                          const SizedBox(height: 25),
                          ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              //                you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),);
                            }
                          },
                          child: const Text('Login'),
                        ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                            onPressed: () {
                              // print('Change to Register');
                              Navigator.pushNamed(context, '/register');
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                              // Navigator.of(context, rootNavigator: true).pushNamed("/register");
                            },
                            child: const Text('Register Account'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                            onPressed: () {
                              Navigator.pushNamed(context, '/test');
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                              // Navigator.of(context, rootNavigator: true).pushNamed("/register");
                            },
                            child: const Text('Test Page'),
                          )
                        ]
                    ),
                  ),
                ],
              ),
            ),
            //If need next section, uncomment below
            // Container(
            //   child: Text('Test'),
            // )
          ],
        ),
      ),
    );
  }
}
