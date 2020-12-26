import 'package:clean_architect/features/data/datasource/binding/binding_datasource.dart';
import 'package:clean_architect/features/data/datasource/binding/local/binding_local.dart';
import 'package:clean_architect/features/data/datasource/binding/remote/binding_remote.dart';
import 'package:clean_architect/features/data/datasource/common/base_datasource_factory.dart';
import 'package:flutter/cupertino.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSource> {
  BindingRemote _bindingRemote;
  BindingLocal _bindingLocal;

  BindingDataSourceFactory({
    @required BindingRemote bindingRemote,
    @required BindingLocal bindingLocal,
  })  : _bindingRemote = bindingRemote,
        _bindingLocal = bindingLocal;

  @override
  BindingDataSource createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.network:
        return _bindingRemote;
        break;
      case DataSourceState.local:
        return _bindingLocal;
      default:
        throw UnsupportedError(
            'DataSourceState $dataSourceState is not applicable in BindingDataSourceFactory');
    }
  }
}
