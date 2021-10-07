import 'binding/binding_datasource.dart';
import 'binding/local/binding_local.dart';
import 'binding/remote/binding_remote.dart';
import 'common/base_datasource_factory.dart';

class BindingDataSourceFactory
    extends BaseDataSourceFactory<BindingDataSource?> {
  BindingDataSourceFactory({
    required BindingRemote bindingRemote,
    required BindingLocal bindingLocal,
  })   : _bindingRemote = bindingRemote,
        _bindingLocal = bindingLocal;

  final BindingRemote? _bindingRemote;
  final BindingLocal? _bindingLocal;

  @override
  BindingDataSource? createData(DataSourceState dataSourceState) {
    switch (dataSourceState) {
      case DataSourceState.network:
        return _bindingRemote;
      case DataSourceState.local:
        return _bindingLocal;
      default:
        throw UnsupportedError(
          'DataSourceState $dataSourceState is not applicable in BindingDataSourceFactory',
        );
    }
  }
}
