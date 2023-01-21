import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled/component_widget/reusable_row.dart';

import '../models/UserModel.dart';
class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode== 200){
      for(Map i in data){
        print(i['name']);
        userList.add(UserModel.fromJson(i));

      }


      return userList;
    }else{

      return userList;
    }
    
    
    
  }
  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,
        title: Text('complex'),
      ),
      body: Column(
        children: [
        Expanded(
        child: FutureBuilder(
        future: getUserApi(),
        builder: (context, AsyncSnapshot<List<UserModel>>snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }else{
            return ListView.builder(
                itemCount:userList.length ,
                itemBuilder:(context,index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                  children: [
                    ReUseableRow(title: 'id', value: snapshot.data![index].id.toString()),
                      ReUseableRow(title: 'name', value: snapshot.data![index].name.toString()),
                       ReUseableRow(title: 'Username', value: snapshot.data![index].username.toString()),
                    ReUseableRow(title: 'email', value: snapshot.data![index].email.toString()),
                    ReUseableRow(title: 'Address', value: snapshot.data![index].address!.city.toString()+'  '+ snapshot.data![index].address!.geo!.lat.toString()),
                  ],
                      ),
                    ),
                  );
                }
            );
          }

          },
        ),
          ),
        ],
      ),
    );
  }
}
