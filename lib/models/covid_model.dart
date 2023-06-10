class CovidModel {
  late String countryName;
  late int totalConfirmedCases;

  CovidModel({required this.countryName, required this.totalConfirmedCases});

  factory CovidModel.fromJSON(Map map){
    return CovidModel(countryName: map["Country"], totalConfirmedCases: map["TotalConfirmed"]);
  }

}