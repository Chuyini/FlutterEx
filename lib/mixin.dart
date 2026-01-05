//Mixib: una forma de usar codigo de una clase en multiples jerarquias de clases
void main(){

  ChildrenBook cBook = ChildrenBook();

  cBook.lend();
  cBook.sell();

}

//Mixin
mixin ItemActions{

  void sell(){
    print("Pretar Libro");

  }
}
mixin PermanetActions on Book{  //con on Book restringimos el mixin a esa clase
  void lend(){
    print("Vender libro");
  }

}

abstract class Book with ItemActions { //Usando las funicones del mixibn
  int noPages = 0;
  String title = "";

}

class ChildrenBook extends Book with PermanetActions{
  int maxAge = 14;
}

class NoteBook{
  num price = 100;
}

// 📝 Nota: Los mixins se parecen a las interfaces, pero pueden contener implementación.
// Es decir, los métodos en un mixin pueden tener cuerpo a diferencia de las iinterfaces
// que la implemntacion la hace las clases hijas.

// Las interfaces son contratos: definen un conjunto de métodos abstractos
// que una clase debe implementar obligatoriamente.

// Las interfaces permiten simular herencia múltiple y establecer un contrato estricto
// sobre lo que una clase debe hacer. Todos los métodos definidos en una interfaz
// deben ser implementados por la clase que la adopta.

mixin Logger {
  void log(String msg) => print('LOG: $msg');
}

abstract class Printable {
  void printData(); // método abstracto
}

class Report with Logger implements Printable {
  @override
  void printData() => log('Imprimiendo reporte...');
}