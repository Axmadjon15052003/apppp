import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:singelton_dars/assets/theme/theme.dart';
import 'package:singelton_dars/core/adapter/hive_types.dart';
import 'package:singelton_dars/core/data_base/object_box.dart';
import 'package:singelton_dars/core/injector/setup_locator.dart';
import 'package:singelton_dars/core/injector/srote_repository.dart';
import 'package:singelton_dars/core/route/app_route.dart';
import 'package:singelton_dars/features/katalog/presentation/bloc/bloc/katalog_bloc.dart';
import 'package:singelton_dars/features/profile/presentation/bloc/profile_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerAdap();
  await StorageRepository.getInstance();
  await HiveRepository.getInstance();
  await LocalDateBase.getInstance();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  File? avatar;

  Future<void> picAvatar(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: source);
    if (file != null) {
      setState(() {
        avatar = File.fromUri(
          Uri.file(file.path),
        );
      });
    }
  }

  List<File> files = [];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      files.addAll(
        result.files
            .map(
              (e) => File.fromUri(
                Uri.file(e.path ?? ''),
              ),
            )
            .toList(),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => KatalogBloc(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRoute.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        // home: const CatalogScreen(),
      ),
    );
  }
}
