
import 'package:cashir_quiz/app/constants/end_points.dart';
import 'package:get/get.dart';

class QuestionsProvider extends GetConnect {

  @override
  void onInit() {
    httpClient.baseUrl = '';
  }



  //returns questions from api
  Future<List> fetchQuestion() async{

    try{
      Response response = await get(EndPoint.api);
      
      if(response.statusCode == 200){
        List data = (response.body['results']);
        
        return data;
      }
      return [];
      
    }catch (e){
      print(e);
      return [];
    }
  }

}
