import 'package:singelton_dars/core/either/either.dart';
import 'package:singelton_dars/core/failure/failure.dart';
import 'package:singelton_dars/features/katalog/data/data_source/data_source.dart';
import 'package:singelton_dars/features/katalog/domain/entities/enties.dart';
import 'package:singelton_dars/features/katalog/domain/repository/repository.dart';

class RepositoryImpl implements KatalogRepository {
  final DataSource _dataSource;
  RepositoryImpl(
    DataSource dataSource,
  ) : _dataSource = dataSource;

  @override
  Future<Either<Failure, List<KatalogEntities>>> getTovar() async {
    try {
      final result = await _dataSource.getTovar();
      return Right(result);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<KatalogSecond>>> getKatalog() async {
    try {
      final result = await _dataSource.getKatalog();
      return Right(result);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
