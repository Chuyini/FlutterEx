//Extensión Methods = métodos de extension

//Sirven para agregar metodos a clases existentes, aunque no sean nuestras

//Por ejemplo, una libreria de Google restringida
void main(){

  Book bk = Book();

  bk.summary = "This interesting and funny";
  //translateToSpanish(bk.summary);
  bk.translateToSpanish(bk.summary);

}


//Ezxtension del metodo
extension on Book{

  //Aqui estamos en la clase book
  String translateToSpanish(String text){
    //Usar api de traduccion
    var translatedText =  text;
    return text;
  }

}


//Se le agrega un nombre despues de la palabra extension para poder usarlo en otros archivos

/*
*
* De hecho podemos hacer un "import main dart hide SpanishSummary"
*
* con esto escondemos el extension method, esto sirve cuando quieres ese mismo metodo
* pero con un comportamiento distinto, escondes el original y sobreescribes el nuevo
*
* */
extension SpanichTranslate on String{ //Extendiendo los metodos de la clase String

  String toSpanish(String text){
    //Usar api de traduccion
    var translatedText =  text;
    return text;
  }


}



class Book{
  int numP = 0;
  String summary = "";
}