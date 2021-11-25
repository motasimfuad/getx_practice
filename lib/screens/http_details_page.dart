import 'package:flutter/material.dart';
import 'package:getx_practice/services/api_services.dart';

class HttpDetailsPage extends StatelessWidget {
  // const HttpDetailsPage({Key? key}) : super(key: key);

  final int id;

  const HttpDetailsPage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: ApiServices().fetchSingleProduct(id),
              builder: (context, AsyncSnapshot snapShot) {
                return Text(snapShot.data.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
