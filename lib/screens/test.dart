import 'package:flutter/material.dart';
import 'package:tyler_todoapp/components/textFormField.dart';
import '../utilities/db.dart';
import '../models/user.dart';
import '../utilities/dbhelper.dart';
import 'package:uuid/uuid.dart';

class Test extends StatelessWidget {
  late User user;

  // const Test({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    final textInputName = TextEditingController();
    final textInputPassword = TextEditingController();
    final textInputCfmPassword = TextEditingController();
    final textInputEmail = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    final screenHeight = MediaQuery.of(context).size.height; //Get Device Height
    //final appBarHeight = AppBar.preferredSize.height; //Get Height of Title App Bar
    final statusBarHeight = MediaQuery.of(context).padding.top; //Get height of status bar
    //To Get Actual app height = screenHeight - appBarHeight - statusBarHeight
    final screenWidth = MediaQuery.of(context).size.width; //Get actual width of device
    final loginHeight = screenHeight * 0.65 - statusBarHeight;
    //This code above only works in Scaffold


    // Create a Dog and add it to the dogs table


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Test'),
        centerTitle: true,
        toolbarHeight: 40.0,
        elevation: 0,
      ),
      body: Container(
        width: screenWidth,
          decoration: const BoxDecoration(
            color: Color(0xff151f2c)
              // Color: Colors.blue[900]
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //width: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              width: screenWidth,
              height: loginHeight,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text('Register Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      letterSpacing: 3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 55),
                  formField(controller: textInputName, hint: 'Name', icon: Icons.account_circle_rounded),
                  const SizedBox(height: 15),
                  formField(controller: textInputEmail, hint: 'Email', icon: Icons.email),
                  const SizedBox(height: 15),
                  formField(controller: textInputPassword, hint: 'Password', icon: Icons.lock),
                  const SizedBox(height: 15),
                  formField(controller: textInputCfmPassword, hint: 'Confirm Password', icon: Icons.lock),
                  IntrinsicWidth( //For all buttons to have same width
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:<Widget>[
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                            onPressed: () {

                              var uuid = Uuid();
                              DatabaseHelper.instance.insertUser(User(
                                userid: uuid.v4(),
                                name: textInputName.text,
                                password: textInputPassword.text,
                                email: textInputEmail.text
                              ));
                                //Need better GUID
                                // Object idHash = "Tyler1263712784192874";
                                // var id = identityHashCode(idHash);
                                // identityHashCode();
                                // print("ID: " );
                                // print(id);
                                //Use model user.dart to update db

                                print(textInputName.text);
                                print(textInputEmail.text);
                                print(textInputPassword.text);
                                print(textInputCfmPassword.text);
                                print(DatabaseHelper.instance.retrieveUsers());
                                //InsertUser(User(userid: userid, name: name, password: password, email: email))
                            },
                            child: const Text('Register Account'),
                          ),
                          ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: const Text('Login'),
                        ),

                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                          //   onPressed: () {
                          //     Navigator.pushNamed(context, '/test');
                          //     // Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
                          //     // Navigator.of(context, rootNavigator: true).pushNamed("/register");
                          //   },
                          //   child: const Text('Test Page'),
                          // )
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
