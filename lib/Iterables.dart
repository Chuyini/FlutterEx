
void main(){

  //Iterables
  List<String> names = ["Pedro", "Miguel", "Sebastian"];
  Set<num> score = {231,245,6,182.2};

  for(String name in names) {//Name es la variable que implemta iterable

      print(name);

  }

  print("******************");

  print(names.first);//Obtiene el primer valor de la lista
  print(names.last);//Otiene el ultimo valor de la lista


  print("Filtrar los elementos de la lista ");
  Iterable<num> filteredScores = score.where((item)=>item>100);

  for(var item in filteredScores){
    print("numero filtrado: $item");
  }

  var result = score.firstWhere((item)=>item>10);//Regresa un solo objeto
  //Pero cuidado porque si no hay ningun elemento tira una exception

  //Hay que manejar esta lista con try catch

  try{
    var resultImposible = score.firstWhere((item)=>item>1000);
    print("Resultado imposible: $resultImposible");


  }on StateError catch (Ex){

    print(Ex.runtimeType);//con esto puedes saber el tipo de exeption
  }


  print("Objeto singular: $result");

  //Encontrar el ultimo
  var last =  score.lastWhere((item)=>item<1, orElse: ()=>-1);//usamos el  or else para evitrano el try
  print("Ultimo: $last");

  var resultNmas = names.any((item)=> item.contains("M"));//regresa un boleano los elemto contiene  una
if (resultNmas){
  print("Si hay M");
}else{
  print("No contiene M");
}

//Ahora si queremos evaluar que todos los elemetos cumplan con la condicion usamos
//Every

var isAllname= names.every((item)=>item.contains("e"));//Si todos los elemtos contienen una consonante a
  print("Es $isAllname que todos los elementos de la lista tienen consonante  e");

  //Metodo MAP que aplica una funcion a todos los elementos

  var for2Scores =  score.map((item)=> {2*item});//<-- a cada elemeto se le multiplica por 2

  print(for2Scores);

  //Un ejemplo paractico seria en mayusculas y minuscilaas de los nimbres

  //upercase = mayúsculas
  //lowercase = minusculas

  var uperCase = names.map((name)=>{
    name.toUpperCase()
  });

  print("***NOMBRES:*****");
  print(uperCase);

}