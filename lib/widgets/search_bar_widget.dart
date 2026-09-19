import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/app_colors.dart';


class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}


class _SearchBarWidgetState extends State<SearchBarWidget> {

  final ImagePicker _picker = ImagePicker();


  Future<void> _showImageOptions() async {

    showModalBottomSheet(
      context: context,

      backgroundColor: AppColors.card,

      builder: (context) {

        return SafeArea(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [


              const Padding(

                padding: EdgeInsets.all(16),

                child: Text(

                  "Choose Image",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 18,

                    fontWeight: FontWeight.bold,

                  ),

                ),

              ),



              ListTile(

                leading: const Icon(

                  Icons.camera_alt,

                  color: Colors.white,

                ),


                title: const Text(

                  "Take Photo",

                  style: TextStyle(

                    color: Colors.white,

                  ),

                ),



                onTap: () async {


                  Navigator.pop(context);



                  final image = await _picker.pickImage(

                    source: ImageSource.camera,

                  );



                  if (image != null && mounted) {


                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(

                        content: Text(

                          "Image selected successfully.",

                        ),

                      ),

                    );


                  }


                },

              ),




              ListTile(

                leading: const Icon(

                  Icons.photo_library,

                  color: Colors.white,

                ),



                title: const Text(

                  "Choose From Gallery",

                  style: TextStyle(

                    color: Colors.white,

                  ),

                ),




                onTap: () async {


                  Navigator.pop(context);



                  final image = await _picker.pickImage(

                    source: ImageSource.gallery,

                  );



                  if (image != null && mounted) {


                    ScaffoldMessenger.of(context).showSnackBar(

                      const SnackBar(

                        content: Text(

                          "Image selected successfully.",

                        ),

                      ),

                    );


                  }


                },

              ),


            ],


          ),

        );


      },

    );


  }




  @override
  Widget build(BuildContext context) {


    return Container(


      margin: const EdgeInsets.symmetric(

        horizontal: 20,

        vertical: 12,

      ),



      height: 55,




      decoration: BoxDecoration(


        color: AppColors.searchBar,



        borderRadius: BorderRadius.circular(30),




        boxShadow: [


          BoxShadow(

            color: Colors.black.withOpacity(0.15),

            blurRadius: 10,

            offset: const Offset(0, 4),

          ),


        ],


      ),





      child: Row(


        children: [



          const SizedBox(width: 18),





          const Icon(

            Icons.search,

            color: Colors.white,

          ),





          const SizedBox(width: 12),





          Expanded(


            child: TextField(



              style: const TextStyle(

                color: Colors.white,

              ),




              decoration: const InputDecoration(



                hintText: "Search places...",




                hintStyle: TextStyle(

                  color: Colors.white70,

                ),




                filled: false,



                border: InputBorder.none,



                enabledBorder: InputBorder.none,



                focusedBorder: InputBorder.none,



              ),



            ),


          ),





          GestureDetector(



            onTap: _showImageOptions,




            child: Container(



              margin: const EdgeInsets.only(

                right: 8,

              ),





              padding: const EdgeInsets.all(10),





              decoration: BoxDecoration(



                color: AppColors.accent,



                shape: BoxShape.circle,



              ),





              child: const Icon(



                Icons.camera_alt,



                color: Colors.white,



                size: 22,



              ),



            ),



          ),



        ],



      ),



    );

  }


}