import 'dart:io';

void main(){

  var url = "";
  try{
  downLoadFile();
  } on SocketException{ //Cuando sabemos los posibles errores que podrian darse

    print("No hay internet");
  } on IOException catch(ex) {

    print("Ocurrio un error al guardar el archivo $ex");

  } on Exception catch(ex, stacktrace){

    print("Exepcion: $ex");
    print("Camino del codigo que recorrio: $stacktrace");
  }finally{//Una seccion por hacer despues de que termino el try catch, error o exito
    //Limpiar cache
    //cleanCache(url);
  }

  //Probamos nuestra funcion
  try{
    LoginUser();//<-- este tira una excepcion
  } on InvalidUser catch (ex){

    print("Causa de error: ${ex.cause}");//<-- este cause podemos mostrarlo en un snackBar

  }

}

//Generar tu propia excepcion

class InvalidUser implements Exception{
  late String cause ;
  InvalidUser(String _cause){

    this.cause = _cause;

  }
}

void LoginUser(){
  throw InvalidUser("Usuario sin permisos");//<-- en esta funcion tiramos la excepcion
}

void downLoadFile(){
  print("Descarga de archivo exitosa");
}

/*
 Nota
 */