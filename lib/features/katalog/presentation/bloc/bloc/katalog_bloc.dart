import 'package:bloc/bloc.dart';
import 'package:singelton_dars/core/usecase/usecase.dart';
import 'package:singelton_dars/features/katalog/data/data_source/data_source.dart';
import 'package:singelton_dars/features/katalog/data/repository/repository.dart';
import 'package:singelton_dars/features/katalog/domain/entities/enties.dart';
import 'package:flutter/foundation.dart';
import 'package:singelton_dars/features/katalog/domain/repository/repository.dart';
import 'package:singelton_dars/features/katalog/domain/usecase/usecase.dart';
import 'package:singelton_dars/features/katalog/domain/usecase/usecase_two/usecase_two.dart';

part 'katalog_event.dart';
part 'katalog_state.dart';

class KatalogBloc extends Bloc<KatalogEvent, KatalogState> {
  KatalogBloc()
      : super(
          KatalogState(
            status: Status.pure,
            tovar: [],
            tovar2: [],
          ),
        ) {
    on<KatalogBlocStarted>((event, emit) async {
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );
      final usecase = KatalogUsecase(
        katalogRepository: RepositoryImpl(
          DataSource(),
        ),
      );
      final either = await usecase.call(NoParams());
      either.either(
        (failure) {},
        (value) {
          emit(
            state.copyWith(
              tovar: value,
              status: Status.succsess,
            ),
          );
        },
      );
    });

    on<GetKatalog>((event, emit) async {
      print("Keldiiiiiii2");
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );
      final usecase = TwoUsecase(
        RepositoryImpl(
          DataSource(),
        ),
      );
      print("Keldiiiiii3");
      final either = await usecase.call(NoParams());
      either.either(
        (failure) {
          print("Failureeeeeeee");
          emit(state.copyWith(status: Status.failure));
        },
        (value) {
          print("Successssssssss $value");
          emit(
            state.copyWith(
              tovar2: value,
              status: Status.succsess,
            ),
          );
        },
      );
    });
  }
}
