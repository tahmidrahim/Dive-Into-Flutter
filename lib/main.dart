import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false, // important!
        primarySwatch: Colors.brown,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  MyAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('Alert!!!'),
            content: Text('Do you want to delete'),
            actions: [
              TextButton(
                onPressed: () {
                  mySnackBar("Yes Clicked", context);
                  Navigator.of(context).pop();
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // CLOSED
                },
                child: Text("No"),
              ),
            ],
          ),
        );
      },
    );
  }

  mySnackBar(message, BuildContext context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inventory")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  MyAlertDialog(context);
                },
                child: Text('Expanded Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
