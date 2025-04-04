import 'package:amazon_clone/API%20INTERGRATION/numbersapi.dart';
import 'package:amazon_clone/BlocExample/quote/QuotePage/quotehomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'API INTERGRATION/jokesapi.dart';
import 'API INTERGRATION/jokescontinuation.dart';
import 'BlocExample/quote/bloc/quote_bloc.dart';
import 'package:todoapi/homepage.dart';
import 'package:todoapi/add_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteBloc(),
      child: MaterialApp(home: HomePg(),),
    );
  }
}
