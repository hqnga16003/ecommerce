// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/firebase_auth_repository.dart' as _i4;
import '../../data/firebase_firestore_repository.dart' as _i7;
import '../../presentation/screen/login/login_bloc/login_bloc.dart' as _i6;
import '../../presentation/screen/main/home/home_bloc/home_bloc.dart' as _i8;
import '../../presentation/screen/main/shop/bloc/shop_bloc.dart' as _i9;
import '../app_module/app_module.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.singleton<_i4.FirebaseAuthRepository>(
        _i4.FirebaseAuthRepository(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i5.FirebaseFirestore>(() => appModule.firebaseFireStore);
    gh.factory<_i6.LoginBloc>(
        () => _i6.LoginBloc(gh<_i4.FirebaseAuthRepository>()));
    gh.singleton<_i7.FirebaseFireStoreRepository>(
        _i7.FirebaseFireStoreRepository(gh<_i5.FirebaseFirestore>()));
    gh.factory<_i8.HomeBloc>(
        () => _i8.HomeBloc(gh<_i7.FirebaseFireStoreRepository>()));
    gh.singleton<_i9.ShopBloc>(
        _i9.ShopBloc(gh<_i7.FirebaseFireStoreRepository>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
