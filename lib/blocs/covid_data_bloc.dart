import 'package:my_flutter_bloc_pattern/models/covid_model.dart';
import 'package:my_flutter_bloc_pattern/repository/repository.dart';
import 'package:rxdart/rxdart.dart'; 


class CovidDataBloc{
  final _respository = Repository();
  final _covidDataFetcher = PublishSubject<List<CovidModel>>();

  Stream<List<CovidModel>> get covidDataStream => _covidDataFetcher.stream;

  fetchCovidData() async{

    List<CovidModel> data = await _respository.getLatestCovidData();
    _covidDataFetcher.sink.add(data);

  }


  dispose(){
    _covidDataFetcher.close();
  }


}

final covidDataBloc = CovidDataBloc();