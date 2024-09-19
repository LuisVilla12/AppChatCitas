import 'package:chat_static/domain/entities/Message.dart';
import 'package:dio/dio.dart';

class GetYesOrNotAnswer{
final _dio= Dio();
Future <Message> getAnswer() async{
  final response = await _dio.get('https://yesno.wtf/api');
  //throw UnimplementedError();
  return Message(
    text:response.data['answer'] , 
    fromWho: FromWho.hers,
    imgURL: response.data['image']);
}
}