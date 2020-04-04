import 'model.dart';

class Car {

  String car_name;
  String country;
  int year;
  List<Model> model;

	Car.fromJsonMap(Map<String, dynamic> map): 
		car_name = map["car_name"],
		country = map["country"],
		year = map["year"],
		model = List<Model>.from(map["model"].map((it) => Model.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['car_name'] = car_name;
		data['country'] = country;
		data['year'] = year;
		data['model'] = model != null ? 
			this.model.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
