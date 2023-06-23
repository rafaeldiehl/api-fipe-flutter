import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  static Dio? _dio;

  static Future<Dio> getInstance() async {
    if (_dio == null) {
      var dir = await getTemporaryDirectory();

      _dio = Dio(
        BaseOptions(
          baseUrl: 'https://parallelum.com.br/fipe/api/v1',
          connectTimeout: const Duration(seconds: 5),
          persistentConnection: true,
        ),
      )..interceptors.add(
          DioCacheInterceptor(
            options: CacheOptions(
              store: HiveCacheStore(dir.path),
              policy: CachePolicy.forceCache,
            ),
          ),
        );
    }

    return _dio!;
  }
}
