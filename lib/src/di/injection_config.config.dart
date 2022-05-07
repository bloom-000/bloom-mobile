// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:common_utilities/common_utilities.dart' as _i5;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/network/api/api_service.dart' as _i9;
import '../data/network/api/multipart_api_service.dart' as _i7;
import '../presentation/i18n/translations.dart' as _i3;
import '../presentation/navigation/screen_navigator.dart' as _i8;
import 'modules/abstract_components_module.dart' as _i11;
import 'modules/local_storage_module.dart' as _i12;
import 'modules/network_module.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final abstractComponentsModule = _$AbstractComponentsModule();
  final localStorageModule = _$LocalStorageModule();
  gh.factory<_i3.AppTranslations>(() => _i3.AppTranslations());
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio());
  gh.lazySingleton<_i5.EventBus>(() => abstractComponentsModule.eventBus);
  gh.lazySingleton<_i6.FlutterSecureStorage>(
      () => localStorageModule.flutterSecureStorage);
  gh.lazySingleton<_i7.MultipartApiService>(
      () => networkModule.multipartApiService(get<_i4.Dio>()));
  gh.lazySingleton<_i8.PageNavigator>(() => _i8.PageNavigator());
  gh.lazySingleton<_i9.ApiService>(
      () => networkModule.apiService(get<_i4.Dio>()));
  return get;
}

class _$NetworkModule extends _i10.NetworkModule {}

class _$AbstractComponentsModule extends _i11.AbstractComponentsModule {}

class _$LocalStorageModule extends _i12.LocalStorageModule {}
