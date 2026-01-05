void main() {


Book book =  Book.blankBook();//<-- usando named constructor

  String book2 =  Book.blankBook() * ":Este es un mensaje";
  print(book2);
  String nothing = Book.blankBook() - 23;
   print(nothing);


}

class Book{

  //Instacias de variables

  int id = 0;
  String? title;
  String? author;

  //Contructor de la clase
  Book(String? this.title, String? author){ //Sintax suggar
    this.author =   author;
  }

  //Named constructors = Constructores con nombres que setean los atributos
  //De manera personalizada o customizada

  Book.blankBook(): title="",author="",id=-1;

  Book.multipleAuthors(String title, List<String> authors):
      this.title = title, this.author = authors.join(",");

  //Usando un factory, que es cuando quiero devolver una Instancia dada una //
  //logica previa

factory Book.fromJSON(Map<String,String> json){

  if(json.containsKey("author") && json.containsKey("title")){
    return Book(json["title"], json["author"]);

  }else{
    return Book.blankBook();
  }
}

//Un ejemplo de usoo sería en cache de Books

static final Map<int,Book> cacheBooks = <int, Book>{} ;

  factory Book.fromCache(int id) {
    return cacheBooks[id] ?? Book.blankBook(); //Si existe regresa el libro si no un libro blanco
  }
  
  //Metodos de La clase son funciones o acciones que hace la clase


 printFullTitle(){
    print("$title");
 }

 printTitle(){
    print("El titulo es $this.title");
 }

 //Operatos

/*
*
* Sirven para definir el coportamineto en un operador aritmetico de las instancias definifido en la clase
* */

  /*Si la idea de los operadores es decirles como reaccionar si llegan a
  ser usadas las clases en operaciones aritmeticas*/

operator +(Book other){
  return Book("${this.title} / ${other.title}", "${this.author} / ${other.author}");
}

operator *(String message){
  return "mensaje $message";
}

operator -(num other){
  return "No hay nada";
}

//



}


//Clases abstractas
//Son un tipo de contrato que obliga a las clases hijas a implementar los metodos abstractos
abstract class Shelf {

  //Hay firma pero no llaves
  void ordenadLibros(); //<-- no tiene implementacion por lo tanto es abstracta
  int calcularNummeroBOOKS(){
    return 23;
  }


}

class PaperShel extends Shelf{

  @override
  void ordenadLibros(){
    //TODO ordenar libros
  }

  @override
  int calcularNummeroBOOKS(){

    return super.calcularNummeroBOOKS(); //<- con super accedemos al padre
  }
}

/*Nota:
*
* - En Dart, super no puede acceder a propiedades privadas (las que empiezan con _).
 -En Java, si el métdo padre es private, no se puede acceder con super.

*
* */