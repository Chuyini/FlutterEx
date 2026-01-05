
//Generics tipo parametrizado = Tipos genericos
import 'dart:ffi';

void main(){

  List<String> names =  ["Miguel","Roberto", "Jesus"];
  List<int> numbers = [1,23,4];
  Map<int, String> players =
  {
    1: "playerS",
    2:"Player3"
  };
  //Gracias al tipo gnerocp podemos hacer instancias con varios tipos de variabvles
  Storage storagePlayer1 = Storage(23);
  Storage storagePlayer2 = Storage("Jed");

  //Se pueden agregar los tipos antes de darles el valor 
  StorageNumbers numPlayer = StorageNumbers<double>(23.34);
  var numInt = StorageNumbers<int>(12);



}
//E, T, S, K, V
//Element, Type, , Key, Value

//Funciona cuando quieres interpolar entre varios tipos de variable

/*
* Por ejemplo si deseas trabajar un dia con  el guardado de datos de un jugador
* y quieres guardar variables de tipo int, string, etc tendrías que hacer varios
* tipos de variables y/o metodos, por eso usamos generics para hacer solo un tipo
*
* */

class Storage <T>{//<-- le decimos que tendremos variables de tipo generico
  late T value;//<-- variable generica

  Storage(this.value);
}

//Tambien se puede usar en metodos

V getUser<V>(int le){//Cuando vayas a usar una variable generica se define qui en los metodos
V value = le as V;//Aqui ya decimos que V es de tipo int

  return value;

}

userQEWLL<E extends num>(double price){ //Aqui decimos que solo int o double pued tener la variable generica
  E playerP =  price as E;

  print(playerP);
}


class StorageNumbers<E extends num>{
  late E values;
  StorageNumbers(this.values);
}


