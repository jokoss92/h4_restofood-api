import 'package:dio/dio.dart';
import 'package:restofood_api/core/models/food_mdl.dart';
import 'package:restofood_api/core/config/endpoint.dart';

class FoodServices{
  static Dio _dio = Dio();

  static Options getHeaders() {
    return Options(
      headers: {
        "Accept" : "application/json",
        // "Authorization": "Bearer token" //Untuk masukin token
      }
    );
  }

  //Get foods data
  static Future<List<FoodModel>> getAll() async {
    var response = await _dio.get(
      Endpoint.baseFood,
      options: getHeaders()
    );


    var foodData = List<FoodModel>();
    response.data["data"].forEach((value){
      foodData.add(FoodModel.fromJson(value));
    });
    return foodData;
  }

  static Future<FoodResponse> createFood(FoodModel foodModel) async{
    var response = await _dio.post(
      Endpoint.baseFood,
      data: FormData.fromMap(foodModel.toMap()),
      options: getHeaders()
    );
    return FoodResponse.fromJson(response.data);
  }

  static Future<FoodResponse> updateFood(FoodModel foodModel, String id) async{
    var foodData = foodModel.toMap();
    // foodData["_method"] = 'PUT';

    var response = await _dio.put(
      Endpoint.baseFood + "/${id}",
      data: FormData.fromMap(foodData),
      options: getHeaders()
    );
    return FoodResponse.fromJson(response.data);
  } 

  static Future<FoodResponse> deleteFood(String id) async{
    var response = await _dio.delete(
      Endpoint.baseFood + "/${id}",
      options: getHeaders()
    );
    return FoodResponse.fromJson(response.data);
  }
}