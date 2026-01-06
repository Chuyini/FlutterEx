import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(WidgetSample());
}

class WidgetSample extends StatelessWidget {
  const WidgetSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Widet Sample",
      home: BotonNavigationBarScreen(),
    );
  }
}

class GesturesDetectionScreen extends StatefulWidget {
  const GesturesDetectionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GesturesDetectionState();
  }
}

class GesturesDetectionState extends State<GesturesDetectionScreen> {
  bool _lightIsOn = false; //luz está prendida
  Color _lightColor = Colors.yellow.shade600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detección de gestos'),
      ),
      floatingActionButton: exFloatB(),
      body: SingleChildScrollView(
        child: Container(
          alignment: FractionalOffset.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lightbulb_outline,
                  color: _lightIsOn ? _lightColor : Colors.black,
                  size: 60,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _lightIsOn = !_lightIsOn;
                  });
                },
                child: Container(
                  color: Colors.yellow.shade600,
                  padding: const EdgeInsets.all(8),
                  // Change button text when light changes state.
                  child: Text('ENCENDER LUZ'),
                ),
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      _lightColor = Colors.red.shade600;
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    padding: const EdgeInsets.all(40),
                    child: const Text('Doble tap me'),
                  )),
              const Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    _lightColor = Colors.yellow.shade600;
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.yellow),
                  padding: const EdgeInsets.all(50),
                  // Change button text when light changes state.
                  child: const Text('Longpress me'),
                ),
              ),
              ImageFromInternet(),
              Padding(
                padding: EdgeInsets.all(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class exFloatB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: const Text("Nuevo"),
      icon: Icon(Icons.add),
      backgroundColor: Colors.teal,
    );
  }
}

class ImageFromInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.unsplash.com/photo-1526666923127-b2970f64b422?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1472&q=80',
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
            child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        ));
      },
    );
  }
}

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: ListView(
        children: [
          Container(
            height: 90,
            color: Colors.blueAccent,
            child: const Center(
              child: Text("Fila 1"),
            ),
          ),
          Container(
            height: 90,
            color: Colors.redAccent,
            child: const Center(
              child: Text("Fila 2"),
            ),
          ),
          Container(
            height: 90,
            color: Colors.teal,
            child: const Center(
              child: Text("Fila 3"),
            ),
          ),
          Container(
            height: 90,
            color: Colors.purple,
            child: const Center(
              child: Text("Fila 4"),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewWidgetBuilder extends StatelessWidget {
  List<String> namesRows = ['A', 'B', 'C', 'D'];
  List<int> colorsRows = [200, 300, 100, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista"),
      ),
      body: ListView.separated(
        itemCount: namesRows.length,
        //<-- este es necesario, dice la cantidad de objetos
        itemBuilder: (context, index) {
          return Builder(
            builder: (newContext) {
              return InkWell(
                onTap: () {
                  ScaffoldMessenger.of(newContext).showSnackBar(
                    SnackBar(
                      content: Text('Apretaste $index'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                },
                child: ListTile(
                  title: Container(
                    height: 90,
                    color: Colors.teal[colorsRows[index]],
                    child: Center(child: Text('Fila ${namesRows[index]}')),
                  ),
                  tileColor: Colors.amber[colorsRows[index]],
                  splashColor: Colors.deepPurple,
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          double height = 10;
          if (index == 2) {
            return Text("Elemento nuevo");
          }
          if (index >= 0) {
            height = 30;
          }
          return Divider(
            height: height,
          );
        },
      ),
    );
  }
}

class BotonNavigationBarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _botonNavegationBarScreenState();
  }
}

class _botonNavegationBarScreenState extends State<BotonNavigationBarScreen> {
  int _selectIndex = 0;

  static const List<Widget> _screens = [
    Image(
      image: NetworkImage('https://picsum.photos/300/300/'),
    ),
    Image(
      image: NetworkImage('https://picsum.photos/200/200/'),
    )
  ];

  void _onIntemTap(index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BotonNavigationBar"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
            label: 'Casa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_sharp),
            label: 'Arbol',
          ),
        ],
        currentIndex: _selectIndex,

        //El focus de del boton donde quieres que aprezca por primer vez
        onTap: _onIntemTap,
      ), //El callback para llamar a la funcion cuando se presion un item),
      body: _screens[_selectIndex],
    );
  }
}
