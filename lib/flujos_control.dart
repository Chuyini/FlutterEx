void main(){

  //IF

  int edad = 15;

  if(edad==15){
    print("Igual a 15");
  }else if(edad >23){
    print("Mayor de 23");
  }

  //For

  for(int i = 0; i>23; i++ ){
    print(i);
  }
  //For In

  List<num> numeros =  [23,45,3.4];

  for(num number in numeros){

    print(number);

  }

  for(var numero in numeros){

    if(numero == 23){
      print("Rompemos el  for In y mostramos $numero ");
      continue;
    }

  }

  //While
  int count = 0;
  while(count < 12){ //Mientras count sea menor a 12
    count ++;
    print(count);
  }
  int retries = 3;

  while(true){
    if(retries == 0 ){
      break; //rompes el while
    }
    retries--;
  }
  //Do while
  int conunt2 = 0;
  do{
    print(conunt2);
    conunt2 ++ ;
  }while(conunt2<12);

  //Switche Case

  var status = "ON" ;

  switch(status){
    case "OF":
      print("APAGADO");
      break;
    case "ON":
      print("PRENDIDO con Return");
      return; //<-- se puede usar un return para regresar un valor y/o parar el programa
    default:
      throw Exception("Valor desconocido"); //<-- se pueden lanzar e
  }



  /*NOTA
  *
  * CONTINUE interrumpe solo la iteración actual y permite que el bucle
  * siga ejecutándose, mientras que
  *
  * BREAK termina el bucle por completo
  *
  * */



}