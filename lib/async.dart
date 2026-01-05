//Programacion asincrona

void main(){

  getUser(); //<-- funcion asíncrona


  print("Obteniedo usuario..."); //<-- operación sincrona

  Future<String> nameU =  getUserName();

  print(nameU);//Estamos imprimiendo la operacion mas no el resultado de la operacion
  //Para eso debemos usar Then y catch
  
  nameU.then((onValue)=>{

    print(onValue)}).catchError((onError)=>{
    print("Ocurrio un error: " +onError)});


}

void getUser(){
  Future.delayed(const Duration(seconds: 2),() => {print("Jesus Manuel Lara")});

  //Tenemos tambien
  //Sirve para ejecutar al instanyte
  Future.value("Al momento");
  Future.sync(()=>"Al momento");
/*
* 🧠 Diferencias clave
| Métod | ¿Ejecuta ahora? | ¿Captura errores? | ¿Usa función? |
| Future.value | No (solo entrega valor) | No | No |
| Future.sync | Sí (ejecuta función) | Sí | Sí |




*/

}


Future<String> getUserName() async {//Manera de hacer una función asíncrona

  return "Ricado Cardona";
}


//Nota: En el caso de la fuccion getUser que tiene delay, no espera y el programa
//Sigue de largo