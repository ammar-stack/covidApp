import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newcovidapp/services/stateservices.dart';
import 'package:shimmer/shimmer.dart';
import 'package:newcovidapp/views/details_screen.dart';
class SearchCountries extends StatefulWidget {
  const SearchCountries({super.key});

  @override
  State<SearchCountries> createState() => _SearchCountriesState();
}

class _SearchCountriesState extends State<SearchCountries> {
  TextEditingController searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    StatesServices statesservices = StatesServices();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon:const Icon(Icons.arrow_back_sharp,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 78, 78, 78),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 20.0,right: 20.0),
                child: TextFormField(
                  style:const TextStyle(color:Colors.white),
                  onChanged: (value){
                    setState(() {
                      
                    });
                  },
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search With Country Name',
                    hintStyle:const TextStyle(color: Colors.white),
                    contentPadding:const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderSide:const BorderSide(width: 5.0, color: Colors.white),
                      borderRadius: BorderRadius.circular(50.0)
                    )
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: statesservices.countriesList(), 
                  builder: (context,AsyncSnapshot<List<dynamic>> snapshot)
                  {
                    if(!snapshot.hasData){
                     return ListView.builder(
                        itemCount: 4,
                      itemBuilder: (context , index){
                        return Shimmer.fromColors(
                          baseColor:Colors.grey.shade700 ,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                          children: [
                            ListTile(
                              title: Container(height: 10, width: 89, color: Colors.white),
                              subtitle: Container(height: 10, width: 89, color: Colors.white),
                              leading:Container(height: 60, width: 60, color: Colors.white)
                            )   
                          ],
                        ),
                        );
                        
                      });
                    } 
                    else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                      itemBuilder: (context , index){
                        String name = snapshot.data![index]['country'];
                        
                        if(searchController.text.isEmpty){
                          return Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                DetailScreen(
                                  name: snapshot.data![index]['country'],//done
                                  image: snapshot.data![index]['countryInfo']['flag'],//done
                                  totalCases: snapshot.data![index]['cases'],//done
                                  totalRecovered: snapshot.data![index]['recovered'],//done
                                  totalDeaths: snapshot.data![index]['deaths'],//done
                                  active: snapshot.data![index]['active'],//done
                                  test: snapshot.data![index]['tests'],//done
                                  totallyRecovered: snapshot.data![index]['recovered'],//done 
                                  critical: snapshot.data![index]['critical'],//done
                                )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country'],style:const TextStyle(color:Colors.white),),
                                subtitle: Text(snapshot.data![index]['cases'].toString(),style:const TextStyle(color:Colors.white),),
                                leading:Image(image:NetworkImage(
                                    snapshot.data![index]['countryInfo']['flag']
                                ),height: 60,width: 60,)
                              ),
                            )   
                          ],
                        );
                        }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                          return Column(
                          children: [
                            ListTile(
                              title: Text(snapshot.data![index]['country'],style:const TextStyle(color:Colors.white),),
                              subtitle: Text(snapshot.data![index]['cases'].toString(),style:const TextStyle(color:Colors.white),),
                              leading:Image(image:NetworkImage(
                                  snapshot.data![index]['countryInfo']['flag']
                              ),height: 60,width: 60,)
                            )   
                          ],
                        );
                        }
                        else{
                          return Container();
                        }
                        
                      });
                    }
                    
                  }),
              )
            ],
          ),
        )
        
      )
    );
  }
}