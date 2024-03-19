import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:singelton_dars/features/profile/data/data_source/profile.dart';
import 'package:singelton_dars/features/profile/domain/entities/entities.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(name: ProfileEntities(name: "", adress: ""))) {
    on<StartedBloc>((event, emit) async {
      final dataSourse = RemoteDataSource();
      final user = await dataSourse.getUser();
      emit(state.copyWith(name: user));
    });
    on<SaveButtonPressed>((event, emit) async {
      final dataSource = RemoteDataSource();
      await dataSource.putUser(event.name, event.adress);
    });
    on<ChangeImage>((event, emit) async {
      ImagePicker imagePicker = ImagePicker();
      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        emit(
          state.copyWith(
            avatar: File.fromUri(
              Uri.file(file.path),
            ),
          ),
        );
      }
    });
  }
}
