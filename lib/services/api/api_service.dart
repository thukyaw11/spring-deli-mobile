import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:spring_deli_app/models/rider/riders_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://spring-snacks.herokuapp.com/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    return ApiService(dio);
  }

  @GET('riders/{param}')
  Future<RidersModel> getRidersList(@Path() String param);

  @GET('rider/{uniqueId}')
  Future<RiderModel> getRiderByUniqueId(@Path() String uniqueId);
}
