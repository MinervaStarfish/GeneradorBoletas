import 'dart:io';
import 'dart:math';
import '../bin/user.dart';
import 'tickets.dart';

//Función para preguntar
dynamic preguntador(String? pregunta, int type) {
  print(pregunta);
  String? dato = stdin.readLineSync();

  switch (type) {
    case 1: //Espera un int
      try {
        return int.parse(dato ?? '0');
      } on FormatException {
        return 0;
      }
    case 2: //Espera un double
      return double.parse(dato ?? '0.0');
    case 3: //Espera un String de nombre
      return dato ?? 'NoName';
    case 4: //Espera un String de siglo
      return dato ?? 'XVIII';
    default: //Espera un String cualquiera
      return dato ?? '';
  }
}

// Función control para universidades
void universitiesQuestion(Universities university) {
  if (university != Universities.UPB) {
    print("\nLo siento, el sorteo sólo es válido para estudiantes de la UPB.");
    exit(0);
  } else {}
}

int selectedArtist(Events) {
  if (Events == Events.primaveraSound) {
    return 1;
  } else if (Events == Events.afterLife) {
    return 2;
  } else {
    return 3;
  }
}

// Función para el primer reto: cantar
void singChallenge(Person luckyPerson, Ticket newTicket) {
  print('\nBienvenido a la primera prueba:');
  int sing = preguntador('Deberás cantarnos una canción del evento.\n1. Si\n2. No\n', 1);
  if (sing == 1) {
    print('\n¡Felicidades, ${luckyPerson.firstName}, pasaste la primera prueba!\n');
  } else {
    print('\nOh no. Fallaste la primera prueba!\nNo puedes seguir participando por los boletos de: ${newTicket.event.name}\n');
    print('\nBuena suerte para la próxima.\n');
    exit(0);
  }
}

// Función para elegir el reto: raparse o bailar
void secondChallenge(Person luckyPerson, Ticket newTicket) {
  print('\nBienvenido a la segunda prueba. Aquí podrás elegir entre:');
  if (preguntador(
          "¿raparte o bailar por una entrada al festival de ${newTicket.event.name}? \n 1. Raparte. \n 2. Bailar.\n",
          1) ==
      1) {
    shaveChallenge(luckyPerson, newTicket);
  } else {
    danceChallenge(luckyPerson, newTicket);
  }
}

// Función del reto raparse
void shaveChallenge(Person luckyPerson, Ticket newTicket) {
  if (luckyPerson.hairAmount > 3) {
    luckyPerson.shave = luckyPerson.hairAmount;
    print("\nListo! pero aún queda un paso por seguir");
  } else {
    print(
        "\nTu pelo no está lo suficientemente largo como para considerarlo un buen trato.");
    print('\nBuena suerte para la próxima.\n');
    exit(0);
  }
}

// Función del reto bailar
void danceChallenge(Person luckyPerson, Ticket newTicket) {
  if (luckyPerson.danceWinner() == true) {
    print("\n¡Estás muy cerca!");
  } else {
    print(
        "\nNo bailas lo suficiente bien para ganarte la entrada.");
    print('\nBuena suerte para la próxima.\n');
    exit(0);
  }
}
