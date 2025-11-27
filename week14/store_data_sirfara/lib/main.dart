import 'package:flutter/material.dart';
import 'pizza_detail.dart';
import 'pizza.dart';
import 'httphelper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pizza - Sirfara",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    return await helper.getPizzaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pizza List")),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.hasError) {
            return const Text("Error fetching data");
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final pizzas = snapshot.data!;

          return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (context, position) {
              final p = pizzas[position];
              return ListTile(
                title: Text(p.pizzaName ?? ""),
                subtitle: Text("${p.description} - € ${p.price}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PizzaDetailScreen(
                        pizza: p,
                        isNew: false,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(),
                isNew: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
