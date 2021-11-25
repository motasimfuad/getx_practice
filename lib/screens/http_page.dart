import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/http_details_page.dart';
import 'package:getx_practice/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest API'),
      ),
      body: FutureBuilder(
        future: ApiServices().fetchProducts(),
        builder: (context, AsyncSnapshot snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(snapShot.data[index]['title']),
                  leading: Image.network(
                    snapShot.data[index]['image'],
                    height: 50,
                    width: 50,
                  ),
                  onTap: () {
                    Get.to(
                      () => HttpDetailsPage(snapShot.data[index].id),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
