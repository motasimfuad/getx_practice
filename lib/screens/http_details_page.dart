import 'package:flutter/material.dart';
import 'package:getx_practice/services/api_services.dart';

class HttpDetailsPage extends StatelessWidget {
  // const HttpDetailsPage({Key? key}) : super(key: key);

  final int id;
  const HttpDetailsPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: ApiServices().fetchSingleProduct(id),
          builder: (context, AsyncSnapshot snapShot) {
            if (snapShot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        snapShot.data['image'],
                        height: 300,
                        width: double.infinity,
                      ),
                      SizedBox(height: 15),
                      Text(
                        snapShot.data['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Price: \$ ${snapShot.data['price']}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Chip(
                        label: Text(
                          snapShot.data['category'].toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        snapShot.data['description'],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
