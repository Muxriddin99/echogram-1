import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echogram/pages/home.dart';
import 'package:echogram/service/database.dart';
import 'package:echogram/service/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = "", password = "", name = "", pic = "", username = "", id = "";
  TextEditingController usermailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserbyemail(email);

      // name = "${querySnapshot.docs[0]["Name"]}";
      // username = "${querySnapshot.docs[0]["username"]}";
      // pic = "${querySnapshot.docs[0]["Photo"]}";
      // id = querySnapshot.docs[0].id;

      await SharedPreferenceHelp().saveUserDisplayName(name);
      await SharedPreferenceHelp().saveUserName(username);
      await SharedPreferenceHelp().saveUserId(id);
      await SharedPreferenceHelp().saveUserPic(pic);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 112, 149, 9),
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 112, 149, 9),
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.teal, Color(0xFF40C4FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 100.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      "LogIn to your account",
                      style: TextStyle(
                          color: Color(0xFFBCB5E9),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: usermailcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.teal,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: userpasswordcontroller,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.teal,
                                    ),
                                  ),
                                  obscureText: true,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      email = usermailcontroller.text;
                                      password = userpasswordcontroller.text;
                                    });
                                  }
                                  userLogin();
                                },
                                child: Center(
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 5.0,
                                    child: Container(
                                      width: 130,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF40C4FF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "SignIn",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                      Text(
                        " Sign Up Now!",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
