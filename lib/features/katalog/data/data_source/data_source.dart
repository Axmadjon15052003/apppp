import 'package:singelton_dars/core/extention/to_entities.dart';
import 'package:singelton_dars/core/failure/failure.dart';
import 'package:singelton_dars/features/katalog/data/model/model.dart';
import 'package:singelton_dars/features/katalog/data/model/model_second.dart';
import 'package:singelton_dars/features/katalog/domain/entities/enties.dart';
import 'package:singelton_dars/features/katalog/presentation/bloc/bloc/katalog_bloc.dart';
import 'package:singelton_dars/features/katalog/presentation/mock_data.dart';
import 'package:singelton_dars/features/katalog/presentation/mock_data_second.dart';

abstract class DataSource {
  Future<List<KatalogEntities>> getTovar();
  Future<List<KatalogSecond>> getKatalog();

  factory DataSource() => _DataSourceImpl();
}

class _DataSourceImpl implements DataSource {
  @override
  Future<List<KatalogEntities>> getTovar() async {
    try {
      final response = tovar['data'];
      var result = (response as List).map(
        (e) => KatalogModel.fromJson(e),
      );
      return result.map((e) => e.toEntities).toList();
    } catch (e) {
      throw const ServerFailure(
        message: "  ",
        code: 400,
      );
    }
  }

  @override
  Future<List<KatalogSecond>> getKatalog() async {
    try {
      final response = katalogs['data'];
      print("First datas ${response}");
      var result = (response as List).map(
        (e) => ModelSecond.fromJson(e),
      );

      print("Main Data -----------?>${result.map((e) => e.toModelSecond).toList()}");
      return result.map((e) => e.toModelSecond).toList();
    } catch (e) {
      throw const ServerFailure(
        message: "  ",
        code: 400,
      );
    }
  }
}
