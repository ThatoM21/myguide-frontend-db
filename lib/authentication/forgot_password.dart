import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            colors: [

              Color(0xFF1A0A2E),

              Color.fromARGB(255, 40, 24, 85),

              Color(0xFF1A0A2E),

            ],

          ),

        ),


        child: SafeArea(

          child: Padding(

            padding: const EdgeInsets.all(20),


            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,


              children: [


                IconButton(

                  onPressed: () {

                    Navigator.pop(context);

                  },


                  icon: const Icon(

                    Icons.arrow_back_ios,

                    color: Colors.white,

                  ),

                ),



                const SizedBox(height: 20),



                const Text(

                  "Forgot Password?",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 28,

                    fontWeight: FontWeight.bold,

                  ),

                ),



                const SizedBox(height: 15),



                const Text(

                  "Enter your email for password reset. We will send you a password reset link.",

                  style: TextStyle(

                    color: Colors.white,

                  ),

                ),



                const SizedBox(height: 40),



                const Text(

                  "Email",

                  style: TextStyle(

                    color: Colors.white,

                  ),

                ),



                const SizedBox(height: 10),



                TextField(

                  decoration: InputDecoration(

                    hintText: "Enter your email",

                    filled: true,

                    fillColor: const Color(0xFF12072A),

                    prefixIcon: const Icon(Icons.email),

                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),

                    ),

                  ),

                ),



                const SizedBox(height: 30),



                Center(

                  child: TextButton(

                    onPressed: () {

                      Navigator.pop(context);

                    },


                    child: const Text(

                      "Back to Login",

                      style: TextStyle(

                        color: Colors.white70,

                      ),

                    ),

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