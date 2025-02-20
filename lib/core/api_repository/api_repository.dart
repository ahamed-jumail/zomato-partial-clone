import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../app_config.dart';

class ApiRepository {
  static String scheme = AppConfig.shared.scheme;
  static String scope = AppConfig.shared.scope;
  static String host = AppConfig.shared.host;

  static BaseOptions options = BaseOptions(
      baseUrl:
          "https://crudcrud.com/api/322dfaa5e994455da46be644f1f9d275/appData");
  static Dio apiClient = Dio(options)
    ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
}
