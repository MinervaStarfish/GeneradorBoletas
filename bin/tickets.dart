enum ColorTicket {
  plateado,
  dorado,
}

enum Events { estereoPicnic, afterLife, primaveraSound }

enum Shape {
  circular,
  rectangular,
  triangular,
}

class Ticket {
  String date;
  Shape shape;
  String owner;
  Events event;
  ColorTicket colorTicket;
  int numRedeem;
  int transferCounter;

  Ticket(
      {required this.date,
      required this.shape,
      required this.event,
      required this.colorTicket,
      required this.owner,
      this.transferCounter = 3,
      this.numRedeem = 1});

  set selectedEvent(int selectedEvent) {
    switch (selectedEvent) {
      case 1:
        event = Events.estereoPicnic;
        break;
      case 2:
        event = Events.afterLife;
        break;
      case 3:
        event = Events.primaveraSound;
        break;
      default:
        event = Events.primaveraSound;
    }
  }

  int transfer(String newOwner) {
    if (transferCounter > 0) {
      transferCounter--;
      owner = newOwner;
      return 0;
    }
    return -1;
  }
}
