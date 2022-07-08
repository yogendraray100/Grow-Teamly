import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testapp/constants/image_constants.dart';
 class LeavesView extends StatefulWidget {
   const LeavesView({ Key? key }) : super(key: key);
 
   @override
   State<LeavesView> createState() => _LeavesViewState();
 }
 
 class _LeavesViewState extends State<LeavesView> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
         title:const Text("Leaves"),
       ),
    body : Column(
      children : [
        Container(
          height: 70,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Expanded(child: TextFormField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(5),hintText: "Search",labelText: "New",fillColor: Colors.white,filled: true),
            )),
            IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ]),
        ),
        Expanded(
          flex: 2,
          child: CachedNetworkImage(imageUrl: ImageConstants.bcc, height: 120,width: 120,fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, progress)=> const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error)=> const Icon(Icons.error),),
        ),
        Expanded(
          flex: 2,child: Container(
          color: Colors.blue,
        )),
        
        Expanded(
          flex: 1,
          child: const Text("Hello")),

      ]
    )
     );
   }
 }