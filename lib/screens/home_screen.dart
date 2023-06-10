
import 'package:flutter/material.dart';
import 'package:my_flutter_bloc_pattern/blocs/covid_data_bloc.dart';
import 'package:my_flutter_bloc_pattern/models/covid_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState(){
     
    super.initState();
  }


  @override 
  void didChangeDependencies(){
    covidDataBloc.fetchCovidData();
    super.didChangeDependencies();
    
  }

  @override
  void dispose() {
     super.dispose();
    covidDataBloc.dispose();
   
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: Colors.green, title: const Text("Latest Covid Data"), ),
      body: StreamBuilder(
        stream: covidDataBloc.covidDataStream,
        builder: (context, AsyncSnapshot<List<CovidModel>> snapShot){
        if (snapShot.hasData){
          return ListView.builder(itemBuilder: (context, index){
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(snapShot.data![index].countryName, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                trailing: Text('+${snapShot.data![index].totalConfirmedCases}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 18)),
              )
            );


          }
          );
        }else if (snapShot.hasError){
            return Text("${snapShot.error}");
        }
        return const Center(child: CircularProgressIndicator());
      })
    );
  }
}