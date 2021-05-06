import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rma_lv4_1/models/bird_counter_model.dart';

class BirdCounterScreen extends StatelessWidget {
  final List<Color> birdColors = [
    Color(0xFF44C5CB),
    Color(0xFFFCE315),
    Color(0xFFF53D52),
    Color(0xFFFF9200),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BirdCounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('rma_lv4_1'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${viewModel.birdsSeen}',
                style: TextStyle(
                  fontSize: 24,
                  color: birdColors[viewModel.latestBird],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Bird #1'),
                    style: ElevatedButton.styleFrom(
                      primary: birdColors[0],
                    ),
                    onPressed: () {
                      viewModel.seeBird(0);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Bird #2'),
                    style: ElevatedButton.styleFrom(
                      primary: birdColors[1],
                    ),
                    onPressed: () {
                      viewModel.seeBird(1);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Bird #3'),
                    style: ElevatedButton.styleFrom(
                      primary: birdColors[2],
                    ),
                    onPressed: () {
                      viewModel.seeBird(2);
                    },
                  ),
                  ElevatedButton(
                    child: Text('Bird #4'),
                    style: ElevatedButton.styleFrom(
                      primary: birdColors[3],
                    ),
                    onPressed: () {
                      viewModel.seeBird(3);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                child: Text('Reset'),
                onPressed: () {
                  viewModel.resetBirds();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
