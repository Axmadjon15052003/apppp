
import 'package:singelton_dars/core/either/either.dart';
import 'package:singelton_dars/core/failure/failure.dart';
import 'package:singelton_dars/core/usecase/usecase.dart';
import 'package:singelton_dars/features/katalog/domain/repository/repository.dart';

import '../entities/enties.dart';

class KatalogUsecase implements UseCase<List<KatalogEntities>, NoParams> {
  final KatalogRepository katalogRepository;
  KatalogUsecase({
    required this.katalogRepository,
  });
  @override
  Future<Either<Failure, List<KatalogEntities>>> call(NoParams param) async{
    
    final result =   await katalogRepository.getTovar();
    return result;
    
  }


}

class  KatalogParam extends NoParams {
  
}

class  TovarParam extends NoParams {
  
}
