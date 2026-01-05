
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

void main(List<String> arguments) {//Los argumentos que se definene en la ejecucion

  //Dart es un lenguaje fuertemente tipado, se deben respetar los tipos
  //Dart puede inferiri los tipos
  var tipos = 32; //Tipo int

  //Sound Null Safty, una variable no puede ser null a menos que tu se lo indiques
  //Ejemplo
  int? Score = null;

  //Dart es miltiplataforma, puede compilar Android, IOS, MacOS, Windows, Linux
  //Y web

  late int score2; //<-- le dice al compilador que luegp será inicializada antes de
  //usarse

  dynamic algo = 23; // Quiere decir que puede cambiar de tipo

  algo = "gol";

  var algo2 = 23;

  //algo2 = "";//Este no se puede mpdificar en tiempo de ejecucion


  score2 = 23;

  final int fin =  23; //Va a ser setaada una vez, no se puede modificar en tiempo de ejecucion
  const mont = "abril"; //No se puede modificar
  //
  //Soporta compilacion JIT (Just in Time)  y AOT (Ahead of time)


  //TIPOS DE DATOS

  //Numericos

  num puntaje = 30; //entero
  num dinero =  20.34; //Floatante o decimal

  int edad = 23;
  double  decimal =  49.23;

  //Strings

  String message = "Hola";
  String saludo =  'Hola, $edad'; //<-- interpolación simple
  String multiple =  "Total a pagar es: ${edad * dinero}"; //<-- interpolacion compuesta
  String concatenadoc = saludo+""+multiple;//<-- concatenado

  //Boolaneos

  var isAdmin =  true;
  var isUser = false;
  bool isTrue =  true;


  //Listas

  var  numbers = [7,5,6]; //implicito
  List<int> number = [3,4,5]; //Explicito

  List<String> nombres = ["Jesus", "Manuel"];
  List<Object> objetos = [23, "edad"];//Multiples tipados

  List<num> valores = [23,10.2]; //

  valores.remove(23);
  valores.add(45);
  valores.removeAt(0); //inidice

  valores.isNotEmpty;

  //Spread copiado de una lista a otra

  var list  = [1,2,3];

  var list2 = [0, ...list]; //Adiciona lo de la lista a la lista 2

  //Null aware spread convierte los valores nulos a enteros 0

  var list3;
  var list4 = [...?list3];//sread null awared = [0];

  //Se puede implemetar logica en las listas

  var menu = ["menu1", "menu2",

    if(edad <20) "menu 3 para menores de 20"
  ];

  var menusBien = [for(var i in list) 'menu $i'];


  //SETs valores unicos no repetidos

  var dias = {"Lunes", "Martes", "Miercoles"};// Set<String>

  //MAPs  valores parecidos a formato JSON

  var scores = {'joe': 23, 'felipe': 24};//Map<String,int>

  //Acceso a los valores

  scores['joe'];

  //Funciones

  void sendMessage(String message, {bool? urgent}){ //named Parameters opcionales

  }
//Llamada  de las funiciones

  //El oden de los parametros importa y tambien inicializarlas en la llamada
  //Esto no importa en los named

sendMessage("Hola",urgent: true);

  bool isOlder(int message){ //Puede ser explicito o implicito el tipo de retorno

    return message > 18;



  }



  //variables de tipo funcion, ya que las funciones son objetos

  var send2 = sendMessage;//Function

  Function sendExplicitV =  sendMessage;

  send2.call("Desde Variable", urgent: false);//<-- Le tienes que pasar los parametros





//A LAS FUNCIONES SE PUEDEN PASAR POR PARAMETRO


void auth(String user, String password , Function afterAction){

  if(user == "Jesus"){
    afterAction.call("Password", urgent:false);
  }
}



auth("Jesus", "password", send2 );

//FUNCIONES ANONIMAS (lambda, closerus) no se define el nombre de la variable

var listN = ["naranja", "azul"];

var printElements = (element){
  print(element);
};

listN.forEach(printElements);

}
