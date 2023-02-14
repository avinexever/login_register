import 'dart:convert';

import 'package:get/get.dart';
import 'package:login_register/model/home_model.dart';
import 'package:http/http.dart' as http;


class HomeController extends GetxController{

  String abc = "Avinash";
  String url = "https://jsonplaceholder.typicode.com/todos";



  Future<List<HomeModel>> getUsers()async{
    List<HomeModel> data = [];
    var response = await http.get(Uri.parse(url));
    print(response.body);
    List res = jsonDecode(response.body);

    for(var element in res){
      HomeModel model = HomeModel.fromJson(element);
      data.add(model);
    }
    return data;
  }

}