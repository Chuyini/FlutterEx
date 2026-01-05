
//Typedef sirve para hacer mas legible el código  desde dart = 2.13
//Se hacer nombres de tipos de datos personalizados
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

typedef ListInt = List<int>;
typedef ConfiMap =  Map<int, Map<String, Map<int, String>>>;

//Tambien se puede con funciones para poner un alias

typedef FunctionIntStr = bool Function(String a, int b);

bool someFunction(String name, int id){
  return false;
}

void otherFunction(FunctionIntStr func, int value){

  print(value);
  func.call("Lara", 21);


}


void main(){


  ListInt lista = [2,3,4];
  //Es muy util en delcaraciones extensas

  Map<int, Map<String, Map<int, String>>> configuration;

  ConfiMap configuration2;

  //Funciones y typedef

  FunctionIntStr isAdmin = (String name, int id){ //asignamos esta funcion anonima
    return true; //Y agregamos la logica que no definimos en el typedef
  };

  isAdmin = someFunction; //Podemos asignar sin necesidad de poner los parametros

  isAdmin.call("werw",23);

  //Pasando las funciones como parámetros

  otherFunction(isAdmin, 23);






}