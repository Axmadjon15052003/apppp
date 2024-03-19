import 'package:singelton_dars/features/katalog/data/model/model.dart';
import 'package:singelton_dars/features/katalog/data/model/model_second.dart';
import 'package:singelton_dars/features/katalog/domain/entities/enties.dart';

extension ModelToEntities on KatalogModel {
  KatalogEntities get toEntities {
    return KatalogEntities(
      oldPrice: oldPrice,
      id: id,
      title: title,
      img: img,
      description: description,
      nowPrice: nowPrice,
      rate: rate,
      isLiked: isLiked,
    );
  }
}

extension ModelSecondToEntities on ModelSecond {
  KatalogSecond get toModelSecond {
    return KatalogSecond(
      id: id,
      title: title,
      img: img,
    );
  }
}
