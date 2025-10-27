

 void  main() {
  String name = "doubi";
  print(name.runtimeType); 	// String

  var age = 18;
  print(age.runtimeType); 	// int

  dynamic dyn = 1.78;
  print(dyn.runtimeType); 	// double

  dyn = "hello";
  print(dyn.runtimeType); 	// String

}