import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled/component_widget/reusable_row.dart';


class ExampleFour extends StatefulWidget {
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode== 200){
      data = jsonDecode(response.body.toString());
    }else{

    }
    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api without model ahha'),
        centerTitle: true,

      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
                builder: (context,snapshpt){
                if(snapshpt.connectionState== ConnectionState.waiting){
                  return Text('loading');
                }else{
                  
                }
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder:(context,index){
                  return Card(
                    child: Column(
                      children: [
                    ReUseableRow(title: 'Name', value: data[index]['name'].toString()),
                        ReUseableRow(title: 'UserName', value: data[index]['username'].toString()),
                        ReUseableRow(title: 'Adress', value: data[index]['address']['street'].toString()),
                        ReUseableRow(title: 'Geo', value: data[index]['address']['geo']['lat'].toString()),
                      ],
                    ),
                  );



                  }
                  );


                }
            ),
          ),
        ],
      ),
    );
  }
}
