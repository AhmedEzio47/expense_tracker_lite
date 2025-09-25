import 'package:dartz/dartz.dart';

import 'app_exception.dart';

typedef Result<T> = Future<Either<AppException, T>>;
