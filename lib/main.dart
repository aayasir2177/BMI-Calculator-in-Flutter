import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double height = 0;
  double weight = 0;
  double bmi = 0;

  String result = "Your BMI Will be Shown Here!";
  String remarks = "BMI Remarks Will be Shown Here!";
  Color resultColor = Colors.grey.shade800;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height in ft',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight in kg',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(

                  // ignore: avoid_print
                  onPressed: () => {
                        height =
                            double.parse(_heightController.text.toString()),
                        weight =
                            double.parse(_weightController.text.toString()),

                        // ft to m
                        height = height / 3.281,

                        // bmi
                        bmi = weight / pow(height, 2),
                        bmi = double.parse(bmi.toStringAsFixed(2)),

                        result = 'Your BMI is $bmi',
                        // ignore: avoid_print
                        print(result),

                        if (bmi < 18.5)
                          {
                            remarks = 'You are Underweight!',
                            resultColor = Colors.yellow.shade800,
                          }
                        else if (bmi >= 18.5 && bmi <= 24.9)
                          {
                            remarks = 'You are Healthy!',
                            resultColor = Colors.green.shade800,
                          }
                        else if (bmi >= 25 && bmi <= 29.9)
                          {
                            remarks = 'You are Overweight!',
                            resultColor = Colors.orange.shade800,
                          }
                        else
                          {
                            remarks = 'You are Obese!',
                            resultColor = Colors.red.shade800,
                          },

                        setState(() {})
                      },
                  child: const Text("Calculate")),
              const SizedBox(
                height: 40,
              ),
              Text(
                result,
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                remarks,
                style: TextStyle(
                    color: resultColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
