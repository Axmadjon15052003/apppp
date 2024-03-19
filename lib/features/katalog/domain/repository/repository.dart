import 'package:singelton_dars/core/either/either.dart';
import 'package:singelton_dars/core/failure/failure.dart';
import 'package:singelton_dars/features/katalog/domain/entities/enties.dart';
import 'package:singelton_dars/features/katalog/presentation/bloc/bloc/katalog_bloc.dart';

abstract class KatalogRepository {
  Future<Either<Failure, List<KatalogEntities>>> getTovar();
  Future<Either<Failure, List<KatalogSecond>>> getKatalog();
}
