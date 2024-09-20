import 'package:chat_static/domain/entities/Message.dart';
import 'package:chat_static/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesOrNotAnswer{
final _dio= Dio();
Future <Message> getAnswer() async{
  final response = await _dio.get('https://yesno.wtf/api');
  // mapea la respuesta de la api
  final yesNoModel=YesNoModel.fromJsonMap(response.data);
  //throw UnimplementedError();
  // Mandar el mensaje
  return yesNoModel.toMessageEntity();
}
}