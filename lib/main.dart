import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:quoteapp/quote.dart';
import 'package:quoteapp/loading.dart';
import 'package:quoteapp/category.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/category',
    routes: {
      '/': (context) => LoadingScreen() ,
      '/home':(context) =>QuoteDisplay(),
      '/category':(context) =>Category(),
    },
  ));

}
// ignore: non_constant_identifier_names





