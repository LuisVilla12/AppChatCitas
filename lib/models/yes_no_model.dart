import 'package:chat_static/domain/entities/Message.dart';

class YesNoModel{
  String answer;
  bool forced;
  String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

// Crear una instancia conformo la respuesta 
  factory YesNoModel.fromJsonMap(Map<String,dynamic>json)=>
  YesNoModel(answer:json['answer'] ,forced: json['forced'], image: json['image']);

  Message toMessageEntity()=> Message(text: answer=='yes'? 'si':'no', fromWho: FromWho.hers, imgURL: image);
}