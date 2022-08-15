
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../network/local/cashHelper.dart';
import 'appStates.dart';

class AppCubit extends Cubit <AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeModeApp(){
    isDark = !isDark;
    CachHelper.putData(key: 'isDark', value: isDark).then((value) => {
    emit(AppModeState())
    });

  }

}