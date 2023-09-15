import 'dart:io';
import 'dart:math';

import 'package:generador_boletas_mariana_osorio/generador_boletas_mariana_osorio.dart'
    as generador_boletas_mariana_osorio;

import 'funciones.dart';
import 'tickets.dart';
import 'user.dart';

void main(List<String> arguments) {
  // Inicio del generador de boletas
  print(
      '\nHola, estamos sorteando tickets para tres festivales en Colombia:\nUna para el Estereo Picnic, una para el de AfterLife y una para el de Primavera Sound.\n\n¿Deseas participar?');

  if (preguntador(" 1. Sí.\n 2. No.\n", 2) == 2) {
    print("\n¡Qué tengas un buen día!");
    exit(0);
  }

  print(
      "\n¡Perfecto!, te solicitaré unos datos necesarios para que podamos empezar:");

  // Objeto de la clase Persona
  Person luckyPerson = Person(
      firstName: preguntador("\n¿Cuál es tu nombre?", 3),
      lastName: preguntador("\n¿Cuál es tu apellido?", 3),
      hairAmount: preguntador(
          "\n¿Cuánto pelo consideras tener en una escala del 1 al 10?", 1),
      universities: Universities.Otra,
      age: preguntador("\n¿Qué edad tienes?", 1));

  // Control para mayoría de edad
  if (luckyPerson.age < 18) {
    print('\nNecesita ser mayor de edad para ganar la boleta.\n');
    exit(0);
  } else {
    // Método de la clase Person para elegir universidad
    luckyPerson.universityStudies = preguntador(
        "\n¿Estudias en alguna de estas universidades?\n 1. UPB.\n 2. EAFIT.\n 3. UdA.\n 4. Ninguna de las anteriores.\n",
        1);

    // Función control para universidades
    universitiesQuestion(luckyPerson.universities);

    // Objeto de la clase Ticket
    Ticket newTicket = Ticket(
        date: "22/04/23",
        shape: Shape.values[Random().nextInt(2)],
        owner: luckyPerson.firstName + luckyPerson.lastName,
        event: Events.primaveraSound,
        colorTicket: ColorTicket.values[Random().nextInt(1)]);

    // Método de la clase Ticket para elegir el evento
    newTicket.selectedEvent = preguntador(
        "\n¿A qué evento deseas ir?\n 1. Estereo Picnic.\n 2. AfterLife.\n 3. Primavera Sound.\n",
        1);

    print(
        "\nPerfecto, para ir al festival de ${newTicket.event.name} deberás hacer lo siguiente:");

    // Función para el primer reto
    singChallenge(luckyPerson, newTicket);

    // Función para elegir el segundo reto
    secondChallenge(luckyPerson, newTicket);

    print(
        "\nFelicidades! Te ganaste el siguiente ticket: \n\n Fecha = ${newTicket.date} \n Forma = ${newTicket.shape} \n Titular = ${newTicket.owner} \n Evento = ${newTicket.event} \n Color de la entrada = ${newTicket.colorTicket} \n Valido para redimir = ${newTicket.numRedeem} Vez/veces.");

    if (preguntador("\n¿Deseas transferirlo?\n 1. Sí.\n 2. No.\n", 1) == 1) {
      String personaTransferir = preguntador(
          "\nEscribe el nombre y el apellido de la persona a la que deseas transferirle el ticket.",
          3);

      newTicket.transfer(personaTransferir);

      print("\nEl ticket ahora es de ${newTicket.owner}\n");
    }
  }
}
