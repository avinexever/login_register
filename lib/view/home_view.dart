import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register/controller/home_controller.dart';
import 'package:login_register/model/home_model.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder<List<HomeModel>>(
        future: controller.getUsers(),
          builder: (context, snapshot){
          if(snapshot.hasData){
            return snapshot.data!.isNotEmpty ? ListView.builder(
              itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
              return ListTile(
                title: Text(snapshot.data?[index].title ?? ""),
                leading: Text("${snapshot.data?[index].id}"),
              );
            }) : const Center(
              child: Text("No data found!"),
            );
          }
          if(snapshot.hasError){
            return const Center(
              child: Text("Something went wrong!"),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
      })
    );
  }
}
