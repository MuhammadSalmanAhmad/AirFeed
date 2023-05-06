// ignore_for_file: unnecessary_const
import 'SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? gender;
  String? dropdownvalue = 'Student';
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
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 150, 222, 205),
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                fontSize: 20)
                                ,
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
                SizedBox(height: 20,),
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text("Create Account",
                        style: GoogleFonts.abel(
                            fontSize: 22,
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
