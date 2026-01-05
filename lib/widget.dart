import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HolaFlutter(),
    title: "Book",
  ));
}

class HolaFlutter extends StatelessWidget {
  List<String> booksId = [
    "final-laugh"
  ]; //Este se obtiene desde el servidor o base de datos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Típica barra arriba
        title: Text(
          "Book",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: UserDataContainerWidget(
        child: BooksScreen(),
      ),
    );
  }
}

class AddBookButton extends StatelessWidget {
  String bookID; //<-- Elemento de Widget

  AddBookButton(this.bookID);

  bool _isSaved = false;

  //realmente
  @override
  Widget build(BuildContext context) {
    //Tienen que estar dento del Build
    //var userData = context.dependOnInheritedWidgetOfExactType<UserData>()!;//Puede regresar nulo pero sabemos que si regresarpa algo
    ///userData.booksId;
    var userData = UserData.of(context); //<-- Este es por convencion
    var _isSaved =
        userData.booksId.contains(bookID); //<-- saber si está guardado

    dynamic button = _isSaved
        ? ElevatedButton(
            onPressed: () {
              _manageBookInLibrary(context, 1);
            }, // deshabilitado
            child: Text("Remover de la librería"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          )
        : ElevatedButton(
            onPressed: () {
              _manageBookInLibrary(context, 2);
            },
            child: Text("Agregar al Carrito"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          );

    // TODO: implement build
    return Directionality(
      //Boton no tiene direccion asi que la envolvemos en un wdget que si tenga
      textDirection: TextDirection.ltr,
      child: button,
    );
  }

  void _manageBookInLibrary(BuildContext context, int option) {
    //Se manada llamar al backend y actializamos la bdd del usuario , metodo (async y largo )
    //Actualizar la data de l inherited widget

    //Se puede llamar solo setState((){})
    //UserData.of(context).booksId.add(widget.bookID);//Agregar al carrito
    // setState(() {

    //});
    //Modificar el state del UserDataContainerWidget

    var userDataContainerWidget =
        _userDataContainerWidget.of(context); //Lo encontramos en el state
    switch (option) {
      case 1:
        userDataContainerWidget.removedToLibrary(bookID);

        break;
      case 2:
        userDataContainerWidget.addToLibrary(bookID);
        break;
    }
  }
}

class BooksyDescirption extends StatelessWidget {
  final String title;
  final String author;
  final String description;

  BooksyDescirption(this.author, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          author,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
        ),
        Text(
          title,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 19.00,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20.0,
          ),
        ),
        Text(
          description,
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }
}

class UserDataContainerWidget extends StatefulWidget {
  final Widget child;

  UserDataContainerWidget({required this.child});

  @override
  _userDataContainerWidget createState() {
    return _userDataContainerWidget();
  }
}

class _userDataContainerWidget extends State<UserDataContainerWidget> {
  List<String> localBookId = []; //Esto se obtiene del servidor

  static _userDataContainerWidget of(BuildContext context) {
    return context.findAncestorStateOfType<
        _userDataContainerWidget>()!; //Este es como un getter para acceder a addToLibrary
  }

  @override
  Widget build(BuildContext context) {
    return UserData(booksId: List.from(localBookId), child: widget.child);
    //El List.from sirve para indicarle que no es la misma lista, no es la misama direccion en memoria
  }

  void addToLibrary(String bookId) {
    setState(() {
      localBookId.add(bookId);
    });
  }

  void removedToLibrary(String bookId) {
    setState(() {
      localBookId.remove(bookId);
    });
  }
}

class UserData extends InheritedWidget {
  final List<String> booksId; //["ed"sd"]
  const UserData({Key? key, required this.booksId, required Widget child})
      : super(key: key, child: child);

  static UserData of(BuildContext context) {
    //Convencion de los inherited widgets
    return context.dependOnInheritedWidgetOfExactType<UserData>()!;
  }

  @override
  bool updateShouldNotify(covariant UserData oldWidget) {
    // TODO: Se debe de notificar a los hijos para que se actualicen?x

    return booksId != oldWidget.booksId;
  }
}

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Center(
            //Container usa all  el espacio por lo que usamos center
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                  ),
                ),
                Container(
                  child: Image(
                    image: AssetImage('images/batmanRie.png'),
                    width: 300.0, //Siempre matien la relacion de aspecto
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 8.0)],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0,
                  ),
                ),
                BooksyDescirption(
                  "Sonrisa Final: El Batman que Ríe vs. Art the Clown",
                  "Damián Nocturne (guión), Valeria Grimm (arte)",
                  "🕷En una Gotham sumida en caos, una serie de asesinatos grotescos con tintes teatrales despiertan la atención del Batman que ríe. Pero esta vez, el horror no viene del Multiverso Oscuro… sino de un ente que no pertenece a ningún universo conocido: Art the Clown, un asesino mudo con una sonrisa tan perversa como la del Joker, pero sin lógica ni límites.Lo que comienza como una cacería se convierte en una guerra de mentes enfermas. El Batman que ríe, con su ejército de Robins encadenados, intenta someter a Art, pero descubre que el payaso no puede ser corrompido… porque ya es el caos puro. Cada página es una danza de sangre, estrategia y sadismo, donde la pregunta no es quién ganará, sino cuál sonrisa será la última en apagarse.",
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                  ),
                ),
                AddBookButton("final-lagh"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
