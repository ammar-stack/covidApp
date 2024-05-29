// ignore_for_file: recursive_getters

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      totallyRecovered,
      test;
  DetailScreen(
      {required this.name,
      required this.image,
      required this.totalCases,
      required this.active,
      required this.critical,
      required this.test,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.totallyRecovered});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black,
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: const Color.fromARGB(255, 75, 75, 75),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Stack(
                    children: [
                      
                      Container(
                        height: 480,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            height: 400,
                            width: double.infinity,
                            decoration:  BoxDecoration(
                              color: Colors.black,
                              borderRadius:const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                      const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15,bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  
                                  Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Cases:",style: TextStyle(fontSize: 25,color:Colors.white),),
                                    Text(widget.totalCases.toString(),style: TextStyle(fontSize: 25,color:Colors.white),)
                                  ],),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Active:",style: TextStyle(fontSize: 25,color:Colors.white),),
                                    Text(widget.active.toString(),style: TextStyle(fontSize: 25,color:Colors.white),)
                                  ],),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Critical:",style: TextStyle(fontSize: 25,color:Colors.white),),
                                    Text(widget.critical.toString(),style: TextStyle(fontSize: 25,color:Colors.white),)
                                  ],),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Tests:",style: TextStyle(fontSize: 25,color:Colors.white),),
                                    Text(widget.test.toString(),style: TextStyle(fontSize: 25,color:Colors.white),)
                                  ],),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Total Deaths",style: TextStyle(fontSize: 25,color:Colors.white),),
                                    Text(widget.totalDeaths.toString(),style: TextStyle(fontSize: 25,color:Colors.white),)
                                  ],),
                              ),
                              Padding(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Total Recovered",style: TextStyle(fontSize: 25,color:Colors.white),),
                                    Text(widget.totalRecovered.toString(),style: TextStyle(fontSize: 25,color:Colors.white),)
                                  ],),
                              ),                          ],
                              ),
                            )
                          ),
                        ),
                      ),
                      Positioned(
                        left:150,
                        bottom: 370,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.image.toString()),
                          maxRadius: 40,
                          minRadius: 40,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

