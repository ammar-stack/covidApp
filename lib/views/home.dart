import 'dart:convert';
import 'package:newcovidapp/Models/allapi.dart';
import 'package:newcovidapp/services/stateservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newcovidapp/views/searchCountries.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  
  String Total="";
  String Recovered = "";
  String Deaths = "";
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  final colorlist = const <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];
  
  Widget build(BuildContext context) {
    StatesServices statesservices = StatesServices();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          FutureBuilder(
            future: statesservices.fetchWorldStatus(),
            builder: ((context,AsyncSnapshot<Allapi> snapshot) {
              if(!snapshot.hasData){
                return Expanded(
                  flex: 1,
                  child: SpinKitFadingCircle(
                    color:Colors.white,
                    size: 50,
                    controller: _controller,
                  )
                );
              }
              else{
                return Column(
                  children: [
                    Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 50),
            child: PieChart(
              dataMap:  {
                "Total": double.parse(snapshot.data!.cases!.toString()),
                "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                "Deaths": double.parse(snapshot.data!.deaths!.toString()),
              },
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true
              ),
              animationDuration: const Duration(seconds: 2),
              chartType: ChartType.ring,
              colorList: colorlist,
              legendOptions: const LegendOptions(
                legendPosition: LegendPosition.left,
                legendTextStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              chartRadius: 140,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15)),
                color: Color.fromARGB(255, 92, 91, 91),
              ),
              height: 55,
              width: double.infinity,
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(snapshot.data!.cases.toString(),
                        style:const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15)),
                color: Color.fromARGB(255, 92, 91, 91),
              ),
              height: 55,
              width: double.infinity,
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recovered",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(snapshot.data!.recovered.toString(),
                        style:const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(15), right: Radius.circular(15)),
                color: Color.fromARGB(255, 92, 91, 91),
              ),
              height: 55,
              width: double.infinity,
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Deaths",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(snapshot.data!.deaths.toString(),
                        style:const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SearchCountries()));
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15), right: Radius.circular(15)),
                ),
                height: 50,
                width: double.infinity,
                child: const Center(
                    child: Text(
                  "Track Countries",
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          )
                  ],
                );
              }
            })),
          
        ],
      ),
    );
  }
}
