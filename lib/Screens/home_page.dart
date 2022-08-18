import 'dart:convert';

import 'package:covid_19_app/Models/countries_model.dart';
import 'package:covid_19_app/Serveses/states_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: statesServices.getCountries(),
        builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading:  Image.network(
                            snapshot.data![index]["countryInfo"]['flag'],
                            width: 50,
                            height: 50,
                          ),
                          title: Text(snapshot.data![index]["country"]),
                          subtitle: Text(snapshot.data![index]["cases"].toString()),
                          trailing: Text(snapshot.data![index]["deaths"].toString()),
                        ),
                      ],
                    ),
                  );
                }
            );
          }
        }
      ),
    );
  }
}
