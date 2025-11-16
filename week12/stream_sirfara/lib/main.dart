import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Sirfara',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;
  late StreamSubscription _colorSubscription;

  List<int> numberHistory = [];
  late StreamController numberStreamController;
  late NumberStream numberStream;
  late StreamTransformer transformer;

  late StreamSubscription subscription;
  late StreamSubscription subscription2;
 
  int lastNumber = 0;
  String values = '';

  @override
  void initState() {
    super.initState();

    colorStream = ColorStream();
    _colorSubscription = colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream.asBroadcastStream();

    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, trace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

    subscription = stream
        .transform(transformer)
        .listen(
          (event) {
            setState(() {
              numberHistory.add(event); 
              lastNumber = event;
              values = 'First: $event';
            });
          },
          onError: (error) {
            setState(() {
              numberHistory.add(-1);
              lastNumber = -1;
            });
          },
        );

    subscription2 = stream.listen((event) {
      setState(() {
        values += ' Second: $event';
      });
    });

    subscription.onError((error) {
      setState(() {
        lastNumber = -1;
      });
    });

    subscription.onDone(() {
      print("Stream has been called 'done'");
    });

    super.initState();
  }

  void stopStream() {
    numberStreamController.close();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
    }
  }

  @override
  void dispose() {
    numberStreamController.close();
    _colorSubscription.cancel();
    subscription.cancel();
    subscription2.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String displayHistory = numberHistory.map((n) => n.toString()).join('-');

    return Scaffold(
      appBar: AppBar(title: const Text('Stream')),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                height: 150, 
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Text(
                    displayHistory,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: addRandomNumber,
                child: const Text('New Random Number'),
              ),

              ElevatedButton(
                onPressed: stopStream,
                child: const Text('Stop Subscription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}