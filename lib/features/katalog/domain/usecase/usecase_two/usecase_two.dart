// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:singelton_dars/core/either/either.dart';
import 'package:singelton_dars/core/failure/failure.dart';
import 'package:singelton_dars/core/usecase/usecase.dart';
import 'package:singelton_dars/features/katalog/data/repository/repository.dart';
import 'package:singelton_dars/features/katalog/domain/entities/enties.dart';
import 'package:singelton_dars/features/katalog/domain/repository/repository.dart';

class TwoUsecase implements UseCase<List<KatalogSecond>, NoParams> {
  final KatalogRepository _katalogRepository;
  TwoUsecase(
    KatalogRepository katalogRepository,
  ) : _katalogRepository = katalogRepository;

  @override
  Future<Either<Failure, List<KatalogSecond>>> call(NoParams param) async {
    final result = await _katalogRepository.getKatalog();
    return result;
  }
}
