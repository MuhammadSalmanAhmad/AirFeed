import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
        SizedBox(height: 10,),
        Center(child: Lottie.asset('assets/social.json',height: 400,width: 400)),
         
         Spacer(),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child:  Text("Share, post, like and communicate with peers in our university. Keep in touch with all the updates going on in campus",style: GoogleFonts.abel(fontSize: 20,color:Color(0XFF455A64) ),),
         ),
         Spacer(flex: 2,),
       ],
      ),
    );
  }
}