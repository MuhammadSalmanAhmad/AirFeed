import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
       
        Center(child: Lottie.asset('assets/education.json',height: 400,width: 400)),
         Text('Welcome to AirFeed',style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.bold,color: const Color(0XFF455A64)),),
         const Spacer(),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child:  Text("Building communtiy of learners,educators interacting with each other and sharing knowledge",style: GoogleFonts.abel(fontSize: 20,color:Color(0XFF455A64) ),),
         ),
         const Spacer(flex: 2,),
        
        

       ],
      ),
    );
  }
}