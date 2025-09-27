import 'package:equatable/equatable.dart';
import 'package:expense_tracker_lite/core/custom_types/json.dart';

class APIEndpoint extends Equatable {
  final String path;
  final String? domain;
  final Duration? cacheValidityDuration;
  final List<String>? cacheKeyExtras;
  final JSON? params;

  const APIEndpoint({
    required this.path,
    this.domain,
    this.cacheValidityDuration,
    this.cacheKeyExtras,
    this.params,
  });

  String get fullUrl {
    String fullUrl = (domain ?? '') + path;
    if (params == null) {
      return fullUrl;
    }
    fullUrl += '?';
    for (final key in params!.keys) {
      fullUrl += '$key=${params![key]}&';
    }
    return fullUrl.substring(0, fullUrl.length - 1);
  }

  APIEndpoint copyWith({List<String>? cacheKeyExtras, JSON? params}) =>
      APIEndpoint(
        path: path,
        domain: domain,
        cacheValidityDuration: cacheValidityDuration,
        cacheKeyExtras: cacheKeyExtras ?? this.cacheKeyExtras,
        params: params ?? this.params,
      );

  @override
  List<Object?> get props => [
    path,
    domain,
    cacheValidityDuration,
    cacheKeyExtras,
    params,
  ];
}
