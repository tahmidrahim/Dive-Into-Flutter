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

  mySnackBar(message, BuildContext context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        titleSpacing: 60,
        toolbarHeight: 80,
        elevation: 6,
        actions: [
          IconButton(
            onPressed: () {
              mySnackBar('Workspaces pressed', context);
            },
            icon: const Icon(Icons.workspaces_sharp),
          ),
          IconButton(
            onPressed: () {
              mySnackBar('Alarm pressed', context);
            },
            icon: const Icon(Icons.access_alarm_rounded),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mySnackBar("Hi, Welcome to Floatbtn", context);
        },
        elevation: 20,
        child: Icon(Icons.accessibility_new),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          if (index == 0) {
            mySnackBar("Welcome to Home", context);
          }
          if (index == 1) {
            mySnackBar("Welcome to Settings", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                accountName: Text("Tahmid Rahim"),
                accountEmail: Text("tahmid@gmail.com"),
                currentAccountPicture: Image.network(
                  'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
                ),
              ),
            ),
            ListTile(
              title: Text('Products'),
              leading: Icon(Icons.production_quantity_limits_sharp),
              onTap: () {
                mySnackBar('Products', context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                mySnackBar('Profile', context);
              },
            ),
            ListTile(
              title: Text('Email'),
              leading: Icon(Icons.email),
              onTap: () {
                mySnackBar("Email", context);
              },
            ),
            ListTile(
              title: Text('Phone'),
              leading: Icon(Icons.phone),
              onTap: () {
                mySnackBar("Phone", context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: 250,
        height: 250,
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(40),
        child: Image.network(
          "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg",
        ),
        decoration: BoxDecoration(
          color: Colors.brown[200],
          border: Border.all(color: Colors.brown, width: 7),
        ),
      ),
    );
  }
}
