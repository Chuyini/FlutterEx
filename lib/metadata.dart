//Metadata = annotation
//@override
//@deprecated

//La metadata sirve para darle informacion al programador
void main(){

  Book book = Book();
  //Aqui se ve un ejemplo de como se usan
  book.numberOfPages();
  book.chapterAndPages();

  //Se puede acceder a annotation en tiempo de ejecucion  mediante "Reflection"

  ///Comnetario de documentacon
  ///Hipervinculos  [nroPages] [

}

///[numberOfPages] hipervinculos entre  conchertes
class Book{
  int numPag = 0;
  String title = "";

  //Usamos  las anotaciondes predefinidas
  @Deprecated("Use new method and better")
  int numberOfPages(){
    
    return this.numPag;
  }

  @VersionRestriction("3.4.2","We use new apis")
  List<int> chapterAndPages(){

    return [1,2,3];
  }
}

//Podemos crear nuestras propias anotaciones

class VersionRestriction{
  final String version;
  final String reason;

  const VersionRestriction(this.version,this.reason);
} 