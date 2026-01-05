//En vez de usar numeros por separados para la logica se usan los enums

/*

  * son un tipo especial de dato que se utilizan para agrupar varias constantes
  * que están logicamente relacionadas. Esto permite trabajar con un conjunto
  * limitado de valores predefinidos, lo que mejora la legibilidad y la
  * mantenibilidad del código.
  *
  * */
enum LoginStatus{ //Se delcaran afuera del Main
  succes,
  error,
  retry,
  userPasswordDoesnt,
  incorrectPassword

}
enum Rol{
  admin,
  user,
  supervisor
}

enum Color{
  red,
  blue,
  yellow
}

void main(){

  var result = LoginStatus.error;



  switch(result) {
    case LoginStatus.succes:
      // TODO: Handle this case.
    case LoginStatus.error:
      print("Cayo en ERRROR");
      // TODO: Handle this case.
    case LoginStatus.retry:
      // TODO: Handle this case.
    case LoginStatus.userPasswordDoesnt:
      // TODO: Handle this case.
    case LoginStatus.incorrectPassword:
      // TODO: Handle this case.
  }

  //Se puedn imprimir las variables

  List<LoginStatus> statusL =  LoginStatus.values; //Le decimos que nos de los valores en una lista

  for(var status in statusL){//Tal vez para iterar

    //TODO: alguna logica

  }

  //Los enums se les puede tratar como una lista ordenada
  if(LoginStatus.values[3] == result){

  }
  //Equivalencia
  if(LoginStatus.values[3] == LoginStatus.incorrectPassword){

  }





}
