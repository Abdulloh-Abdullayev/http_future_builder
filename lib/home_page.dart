import 'package:flutter/material.dart';
import 'package:http_future_builder/models/user_model.dart';
import 'package:http_future_builder/servic/users_servic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("NBU kurs"),
      ),
      body: FutureBuilder(
        future: ServicUsers.apiGet(),
        builder: (context, AsyncSnapshot<List<PriseModel>> snap){
          if(!snap.hasData){
            return CircularProgressIndicator();
          }else
            if(snap.hasError){
              return Center(
                child: Text("No Data"),
              );
            }else{
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: snap.data!.length,
                  itemBuilder: (context, index){
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(snap.data![index].title.toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        subtitle: Text(snap.data![index].date.toString(),style: TextStyle(fontSize: 16),),
                        leading: Text(snap.data![index].code.toString()),
                        trailing: Text("${snap.data![index].cbPrice.toString()}",style: TextStyle(color: Colors.lightBlueAccent),),
                      ),
                    );
                  }
              );
            }

        },
      )
    );
  }
}
