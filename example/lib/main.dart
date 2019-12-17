import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
          ),
          itemBuilder: (_, i) => FancyShimmerImage(
            imageUrl: dataDefaultError[i].url,
            shimmerBaseColor: dataDefaultError[i].shimmerBaseColor,
            shimmerHighlightColor: dataDefaultError[i].shimmerHighlightColor,
            shimmerBackColor: dataDefaultError[i].shimmerBackColor,
            errorWidget: dataDefaultError[i].errorWidget,
          ),
          itemCount: 15,
        ),
      ),
    );
  }
}