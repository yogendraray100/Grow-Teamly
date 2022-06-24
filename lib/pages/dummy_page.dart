import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/constants/image_constants.dart';
import 'package:testapp/models/dummypage_model.dart';

class DummyPage extends StatefulWidget {
  final DummyPageModel data;
  
  const DummyPage({ Key? key, required this.data, }) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name),
        centerTitle: true,
      ),
      body: Center(
        child: SvgPicture.asset(ImageConstants.boy,height: 150),
      ),
      
      
    );
  }
}