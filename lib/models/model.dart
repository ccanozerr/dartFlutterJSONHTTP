class Model {

  String model_name;
  int price;
  bool isFuel;

	Model.fromJsonMap(Map<String, dynamic> map): 
		model_name = map["model_name"],
		price = map["price"],
		isFuel = map["isFuel"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['model_name'] = model_name;
		data['price'] = price;
		data['isFuel'] = isFuel;
		return data;
	}
}
