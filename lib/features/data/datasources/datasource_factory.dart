import 'package:clean_architect/features/data/datasources/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/datasources/binding/cache/cache_remote.dart';
import 'package:clean_architect/features/data/datasources/binding/network/binding_api.dart';
import 'package:clean_architect/features/data/datasources/common/base_datasource_factory.dart';
import 'package:flutter/cupertino.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSource> {
  BindingApi _bindingApi;
  CacheRemote _cacheApi;

  BindingDataSourceFactory({
    @required BindingApi bindingApi,
    @required CacheRemote cacheApi,
  })  : _bindingApi = bindingApi,
        _cacheApi = cacheApi;

  @override
  BindingDataSource createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.network:
        return _bindingApi;
        break;
      case DataSourceState.local:
        return _cacheApi;
      default:
        throw UnsupportedError(
            'dataSourceState $dataSourceState is not applicable in BindingDataSourceFactory');
    }
  }
}
