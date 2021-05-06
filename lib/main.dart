import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rma_lv4_1/models/bird_counter_model.dart';
import 'package:rma_lv4_1/screens/bird_counter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BirdCounterModel(),
      child: MaterialApp(
        home: BirdCounterScreen(),
      ),
    );
  }
}
