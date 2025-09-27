import 'package:expense_tracker_lite/network/api_endpoint.dart';

enum APIEndpoints {
  exchangeRates(APIEndpoint(path: '/api/historical/{date}.json'));

  const APIEndpoints(this.endpoint);

  final APIEndpoint endpoint;
}
