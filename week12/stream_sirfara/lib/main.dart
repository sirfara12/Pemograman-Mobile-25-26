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

  int lastNumber = 0;
  late StreamController numberStreamController;
  late NumberStream numberStream;
  late StreamTransformer transformer;

  late StreamSubscription subscription; 

  @override
  void initState() {
    super.initState();
    
    // Inisialisasi ColorStream
    colorStream = ColorStream();
    _colorSubscription = colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;
      });
    });

    // Inisialisasi NumberStream
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    
    // Inisialisasi StreamTransformer
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, trace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );
    
    Stream stream = numberStreamController.stream;
    subscription = stream
      .transform(transformer)
      .listen(
        (event) {
          setState(() {
            lastNumber = event;
          });
        },
        onError: (error) { 
          setState(() {
            lastNumber = -1;
          });
        },
      );
      
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                lastNumber.toString(),
                style: const TextStyle(fontSize: 48, color: Colors.white),
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