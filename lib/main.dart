import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppEx()
    );
  }
}
// to route we need statefull widget because it has context
class MyAppEx extends StatefulWidget {
  const MyAppEx({super.key});

  @override
  State<MyAppEx> createState() => _MyAppExState();
}

class _MyAppExState extends State<MyAppEx> {
  String buttonName = 'Click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Title'),
        ),
        body: Center(
          child: currentIndex == 0
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.deepPurpleAccent.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Color.fromARGB(232, 218, 16, 16),
                          backgroundColor: Colors.orange[200],
                        ),
                        onPressed: () {
                          setState(() {
                            buttonName = 'Clicked';
                          });
                        },
                        child: Text(buttonName),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => NextPage(),
                            ),
                          );
                        },
                        child: const Text('Next Page'),
                      ),
                    ],
                  ),
                )
              // : Image.network(
              //     'https://www.tripsavvy.com/thmb/HOyyPeqcMSo_O_ZJ2eLosHEfz9E=/2121x1414/filters:fill(auto,1)/GettyImages-498928946-59cd1dd3af5d3a0011d3a87e.jpg'),
              : Image.asset('images/sky.jpg'),
          // uncomment assets in pubspec.yaml file, download package or flutter pub get (in bash)
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Setttings',
              icon: Icon(Icons.settings),
            )
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
