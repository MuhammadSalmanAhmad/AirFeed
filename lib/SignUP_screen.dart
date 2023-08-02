// ignore_for_file: unnecessary_const
import 'dart:math';
import 'package:air_feed/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:air_feed/userinfo/users-class.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  /// here I am defining my controllers for all the textfields */
  /// and also defining my user class object */

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Users user = Users();
  String? gender;
  String? dropdownvalue = 'Student';

  //firebase auth instance and firebase realtime databse instance ref defined here

  FirebaseAuth auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref("Users/");
  @override
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 70,
                ),

                Text(
                  "Sign Up",
                  style: GoogleFonts.lato(
                      color: Color(0XFF455A64),
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/me.jpg"),
                    radius: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  runSpacing: 15,
                  children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your name",
                        helperStyle:
                            TextStyle(color: Color(0XFF455A64), fontSize: 10),
                        labelText: "Name",
                        labelStyle:
                            TextStyle(color: Color(0XFF455A64), fontSize: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(color: Color(0XFF455A64), width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                      },
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Enter your email",
                        helperStyle:
                            TextStyle(color: Color(0XFF455A64), fontSize: 10),
                        labelText: "Email",
                        labelStyle:
                            TextStyle(color: Color(0XFF455A64), fontSize: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(color: Color(0XFF455A64), width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Enter your password",
                        helperStyle:
                            TextStyle(color: Color(0XFF455A64), fontSize: 10),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Color(0XFF455A64), fontSize: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(color: Color(0XFF455A64), width: 2.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                      },
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Select your gender",
                  style: TextStyle(color: Color(0XFF455A64), fontSize: 20),
                ),
                RadioListTile(
                    title: const Text(
                      "Male",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    value: "male ",
                    groupValue: gender,
                    onChanged: (val) {
                      setState(() {
                        gender = val.toString();
                      });
                    }),
                RadioListTile(
                    title: const Text(
                      "Female",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    value: "female ",
                    groupValue: gender,
                    onChanged: (val) {
                      setState(() {
                        gender = val.toString();
                      });
                    }),
                //here we go again

                const Text(
                  "Are you a student, teacher or an alumni?",
                  style: TextStyle(color: Color(0XFF455A64), fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 150, 222, 205),
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),

                  //this is my drop down button for the user to select their role

                  child: DropdownButton(
                      value: dropdownvalue,
                      icon: Icon(Icons.arrow_downward_rounded),
                      iconEnabledColor: Colors.blueGrey,
                      dropdownColor: Colors.tealAccent,
                      iconSize: 30,
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            "Student",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          value: "Student",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Teacher",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          value: "Teacher",
                        ),
                        DropdownMenuItem(
                          child: Text(
                            "Alumni",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          value: "Alumni",
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropdownvalue = value;
                        });
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      backgroundColor: Color.fromARGB(255, 76, 98, 109),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        try {
                          var userID = Random().nextInt(1000).toString();
                        await ref.child(userID).set({
                          "id": userID,
                          "name": userNameController.value.text,
                          "email": emailController.value.text,
                          "password": passwordController.value.text,
                          "gender": gender,
                          "role": dropdownvalue
                        });
                          await auth.createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString());
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          Utilities().show_Message("Account Created");
                        } on FirebaseAuthException catch (e) {
                          String errorMessage;
                          switch (e.code) {
                            case 'weak-password':
                              errorMessage =
                                  "The password provided is too weak.";
                              break;
                            case 'email-already-in-use':
                              errorMessage =
                                  "The account already exists for that email.";
                              break;
                            default:
                              errorMessage =
                                  "An error occurred. Please try again later.";
                              break;
                          }
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          Utilities().show_Message(errorMessage);
                        } catch (e) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          Utilities().show_Message(
                              "An error occurred. Please try again later.");
                        }

                        
                      }
                    },
                    child: Text("Create Account",
                        style: GoogleFonts.abel(
                            fontSize: 20,
                            fontWeight: FontWeight.bold) //TextStyle
                        )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 19, 48, 62),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
