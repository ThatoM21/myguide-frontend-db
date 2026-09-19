import 'package:flutter/material.dart';

import 'forgot_password.dart';
import '../screens/main_screen.dart';


class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(

            begin: Alignment.topLeft,

            end: Alignment.bottomRight,

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



                const SizedBox(height:20),



                const Text(

                  "WELCOME BACK EXPLORER",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 30,

                    fontWeight: FontWeight.bold,

                  ),

                ),



                const SizedBox(height:15),



                const Text(

                  "Login to continue exploring Pretoria",

                  style: TextStyle(

                    color: Colors.white70,

                    fontSize:16,

                  ),

                ),



                const SizedBox(height:40),



                const Text(

                  "Username",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize:16,

                  ),

                ),



                const SizedBox(height:10),



                TextField(

                  decoration: InputDecoration(

                    hintText:"Enter your username",

                    filled:true,

                    fillColor:
                    const Color(0xFF12072A),


                    prefixIcon:
                    const Icon(

                      Icons.person,

                      color: Colors.white,

                    ),


                    border: OutlineInputBorder(

                      borderRadius:
                      BorderRadius.circular(12),

                    ),

                  ),

                  style:
                  const TextStyle(
                    color:Colors.white,
                  ),

                ),



                const SizedBox(height:20),




                const Text(

                  "Password",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize:16,

                  ),

                ),



                const SizedBox(height:10),



                TextField(

                  obscureText:true,


                  decoration: InputDecoration(

                    hintText:"Enter your password",


                    filled:true,


                    fillColor:
                    const Color(0xFF12072A),



                    prefixIcon:
                    const Icon(

                      Icons.lock,

                      color: Colors.white,

                    ),


                    border: OutlineInputBorder(

                      borderRadius:
                      BorderRadius.circular(12),

                    ),

                  ),



                  style:
                  const TextStyle(
                    color:Colors.white,
                  ),

                ),




                const SizedBox(height:30),




                SizedBox(

                  width:double.infinity,

                  height:50,


                  child: ElevatedButton(

                    onPressed: () {


                      Navigator.pushReplacement(

                        context,


                        MaterialPageRoute(

                          builder:(context)=>

                          const MainScreen(),

                        ),

                      );


                    },


                    style: ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.deepPurple,


                      foregroundColor:
                      Colors.white,


                      shape: RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(15),

                      ),

                    ),



                    child: const Text(

                      "LOGIN",

                      style: TextStyle(

                        fontSize:17,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),


                  ),

                ),





                const SizedBox(height:15),




                Align(

                  alignment: Alignment.centerLeft,


                  child: TextButton(


                    onPressed: () {


                      Navigator.push(

                        context,


                        MaterialPageRoute(

                          builder:(context)=>

                          const ForgotPassword(),

                        ),

                      );


                    },


                    child: const Text(

                      "Forgot Password?",


                      style:TextStyle(

                        color:Colors.white,

                        fontSize:16,

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