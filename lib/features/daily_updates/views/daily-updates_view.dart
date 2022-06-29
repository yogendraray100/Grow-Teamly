import 'package:flutter/material.dart';
import 'package:testapp/features/daily_updates/model/dailyupdate_model.dart';
import 'package:testapp/features/daily_updates/services/dailyupdate_services.dart';

class DailyUpdatesView extends StatefulWidget {
  const DailyUpdatesView({ Key? key }) : super(key: key);

  @override
  State<DailyUpdatesView> createState() => _DailyUpdatesViewState();
}

class _DailyUpdatesViewState extends State<DailyUpdatesView> {
List<DailuUpdateModel> dailyUpdates = [];
bool _isloading = true;

  @override
  void initState() {
    super.initState();
    getDailyUpdates();
    
  }
  getDailyUpdates()async{
    DailyUpdateServices dailyUpdate = DailyUpdateServices();
   dailyUpdates = await dailyUpdate.fetchDailyUpdates();
   _isloading = false;
   if(mounted) setState(() {});
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : false,
        title: const Text("Daily Updates"),
      ),
      body: _isloading ? const CircularProgressIndicator(): ListView.separated(
        separatorBuilder: (BuildContext context,int index) => const Divider() ,
        itemCount: dailyUpdates.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(dailyUpdates[index].title ?? ""),
            subtitle: Text(dailyUpdates[index].description ?? ""),

          );
        },
      ),
    );
  }
}