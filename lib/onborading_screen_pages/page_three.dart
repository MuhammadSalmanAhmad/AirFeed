import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:air_feed/SignUP_screen.dart';
class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
        const SizedBox(height: 20,),
        Center(child: Lottie.asset('assets/blog.json',height: 400,width: 400)),
         
         const Spacer(),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child:  Text("Create and publish your blog, articles or research paper's",style: GoogleFonts.abel(fontSize: 20,color:const Color(0XFF455A64) ),),
         ),
         const Spacer(flex: 2,),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           child: Row(mainAxisAlignment: MainAxisAlignment.end,
           children: [
           Spacer(),
           IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpScreen()));
           }, icon: Icon(Icons.arrow_circle_right),iconSize: 70,color: const Color(0XFF455A64)),
          
           ],),
           
         ),
          SizedBox(height: 20,)
       ],
      ),
    );
  }
}