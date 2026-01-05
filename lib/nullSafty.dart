/*
* Null-Safty =  Seguridad ante null
*
* No permitir que una variable apunte a null  cuando se espera
* Que este apuntando a un valor no-null
* Eliminar los "null pointer exception"
*
* */

//Null la asuencia de un valor
void main(){

  //Nullable
  String? name; //NUll || String

  name=null;

  //Al hacer una variable nullable, solo se puede usar los métodos de la interseccion de
  //String y Null

  name.toString();
  name.hashCode;
  name=="as";

  String? sr =  giveMeString(23);
  //Null aware operator (?) Operador consciente de los null
  //no usar la variable nulleable es seguro y cuanodo no marca error
  //eS DECIR A NIVLE DE METODOS DE UN TIPO NO SE PERMITE USAR VARIABLES NULAS
  String? nm;
  //print(nm.length); <-- no se puede usar porque es null

  print(nm?.length); //te regresa null

  //Casting away nullability (!) = ignorar que es nulleable y usar el tipo no nulable

  Shelf s =  Shelf();
  List<Book> Lb = [];
  s.setBooks([]);//Lista vacia
  s.printNumberOfBooks();



}

String giveMeString(int n){

  if(n==0){
    return "zero";

  }else if(n<0)
    {
      throw ArgumentError("Error valor negativo");

    }else{
    if(n>1000) {
      return "Big";
    }else{
      return n.toString();
    }
  }
}

class Book{
  int pages;
  int price;
  Book(this.pages, this.price);

  int givePrice(){
    int price;

    if(this.pages>100){
      price = 23;
    }else{
      price = 10;
    }
    print(price);
    return price;
  }

  //Type promotion

    int priceWitDiscount([int? dicount]){

    if(dicount!=null){//Este es el type Promotion, ver la variable y analizarla
      return this.price - dicount;
    }else{
      return this.price;
    }


    }


}

class Shelf{
  List<Book>? books;//Aqui dices que puede ser null ()

  late final library; //<-- solo puede ser asignado una vez en tipo de ejecucion
  String? addres; //puede ser nula
  setBooks(List<Book> b1){
    this.books =  b1;
  }


  void printAdress(){
    var localAdressToManage =  addres;

    if(localAdressToManage!=null/*addres!=null*/){//La promocion de un atributo en un metodo es mas dificil
      print("La direccion del estante es: "+localAdressToManage/*addres*/);//Tendriamos que hacer uso del operador
      // (!) prometiendo que esa variable nunca será null
      //optamos mejor por promover el tipo  de una variable local
    }

  }

  printNumberOfBooks(){
    print(books!.length);//<-- aqui le dices que nunca va a ver null en tiempo de ejecucion
  }

}