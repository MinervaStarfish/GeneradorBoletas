import 'dart:math';

enum Universities{
  UPB,
  EAFIT,
  UdA,
  Otra,
}

class Person{
  
  String firstName;
  String lastName;
  int age;
  int hairAmount;
  Universities universities;


  Person(
    {
      required this.firstName,
      required this.lastName,
      required this.hairAmount,
      required this.universities,
      required this.age,
    }
  );

  bool danceWinner () {
    if (Random().nextInt(11)>6){
      return true;
    }else{
      return false;
    }
  }

  // Método para raparse
  set shave(int actualHairAmount) {
    if (canShave) hairAmount = 0;
  }

  // Método de estandar para raparse
  bool get canShave => hairAmount > 4;

  // Método para elegir la universidad
  set universityStudies(int universityStudies) {
    switch (universityStudies) {
      case 1:
        universities = Universities.UPB;
        break;
      case 2:
        universities = Universities.EAFIT;
        break;
      case 3:
        universities = Universities.UdA;
        break;
      case 5:
        universities = Universities.Otra;
        break;
      default:
      universities = Universities.Otra;
    }
  }
  
}
  