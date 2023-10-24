import '../../../core/const/base_url.dart';
import '../../../core/domain/base_api_client.dart';

class WeatherApiClient extends BaseApiClient {
  WeatherApiClient() : super(baseUrl: openWeatherMapBaseUrl);
}
