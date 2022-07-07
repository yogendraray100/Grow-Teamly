import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testapp/helpers/image_picker_helper.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({ Key? key }) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
        title:const Text("Attendance"),
      ),
      body : Column(
        children : [
          ElevatedButton(onPressed: (){
            showModalBottomSheet(context: context,shape :const RoundedRectangleBorder(
              borderRadius : BorderRadius.only(
               topLeft: Radius.circular(10),
                    topRight: Radius.circular(10), 
              ),
            ), builder : (context){
              return SizedBox(
                //height: 123,
                child : Column(
                  mainAxisSize: MainAxisSize.min,
                  children :  [
                    ListTile(
                      onTap: () async{
                       //if(kDebugMode) print("camera tapped");
                       Navigator.pop(context);
                      _pickedImage = await ImagePickerHelper().pickImage(ImageSource.camera);
                      
                       print(_pickedImage?.path);
                       setState((){});


                      },
                      leading :const Icon(Icons.camera_alt),
                      title :const Text("Camera"),
                    ),
                    ListTile(
                      onTap: ()async{
                        Navigator.pop(context);
                        _pickedImage = await ImagePickerHelper().pickImage(ImageSource.gallery);
                      
                       print(_pickedImage?.path);
                       setState((){});
                      


                      },
                      leading :const Icon(Icons.browse_gallery),
                      title :const Text("Gallery"),
                    )
                  ]
                )
                
               
              );
            });
          }, child: const Text("Pick an Image")),
          if(_pickedImage != null)...{
           Stack(
            alignment : Alignment.topRight,
            children: [
               Image.file(File(_pickedImage!.path)),
               IconButton(
                onPressed : (){
                  _pickedImage = null;
                  setState((){});

                },
                icon:const Icon(Icons.cancel),
               )
            ]
           ),
          }

        ]
      )
      
    );
  }
}