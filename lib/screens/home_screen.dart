import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import '../models/PostModel.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 List<PostModel> postList= [];
class _HomeScreenState extends State<HomeScreen> {
  Future<List<PostModel>> getPostApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var data = jsonDecode(response.body.toString());
if(response.statusCode ==200){
  for(Map i in data){
    postList.add(PostModel.fromJson(i));
  }
  return postList;
}else{
  return postList;
}
  }








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
                builder:(context,snapshot){
                if(!snapshot.hasData){
                  return const Text('Loading');
                }else{
                  return ListView.builder(
                    itemCount: postList.length,
                      itemBuilder:(context,index){
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                             // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('this is userid ${postList[index].userId.toString()}'),
                                SizedBox(height: 10,),
                                Divider(indent: 1, thickness:2,),
                                Text(postList[index].id.toString()),
                                Text(postList[index].title.toString()),
                                Text(postList[index].body.toString()),

                              ],
                            ),
                          ),
                        );
                      }
                  );

                }
                }

            ),
          ),
        ],

      ),
    );
  }
}
