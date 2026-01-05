//Programacion asincrona usando await

void main() async{


  var getNameUser =  await getUser(); //<-- espera a que termine la funcion

  print("Nombre del usuario: "+getNameUser);



  print("Obteniedo usuario..."); //<-- operación sincrona



}

Future<String> getUser(){
  return Future.delayed(const Duration(seconds: 2),() => "Jesus Manuel Lara");//Regresamos String


}
