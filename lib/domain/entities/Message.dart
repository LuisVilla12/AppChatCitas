enum FromWho {me, hers}

class Message {
  final String text;
  final String? imgURL;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imgURL,
    required this.fromWho,
  });
}
