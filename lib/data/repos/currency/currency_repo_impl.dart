import 'dart:isolate';

import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/data/models/exchange_rates_model.dart';
import 'package:expense_tracker_lite/data/repos/currency/currency_repo.dart';
import 'package:expense_tracker_lite/network/api_endpoints.dart';
import 'package:flutter_common_package/network_layer.dart';

class CurrencyRepoImpl implements CurrencyRepo {
  const CurrencyRepoImpl(this.networkManager);

  final NetworkManager networkManager;

  @override
  Result<ExchangeRatesModel> getExchangeRates({
    required String base,
    required String date,
  }) async {
    try {
      const appId = String.fromEnvironment('APP_ID');
      final result = await networkManager.request(
        RouteConfig(
          path: APIEndpoints.exchangeRates.endpoint.path.replaceAll(
            '{date}',
            date,
          ),
          requestType: RequestType.get,
          parameters: {'app_id': appId, 'base': base},
          shouldCacheResponse: true,
          maxCacheAge:
              APIEndpoints.exchangeRates.endpoint.cacheValidityDuration,
        ),
      );
      return Right(
        await Isolate.run(() => ExchangeRatesModel.fromJson(result)),
      );
    } catch (ex) {
      return Left(AppException.fromException(ex));
    }
  }
}
