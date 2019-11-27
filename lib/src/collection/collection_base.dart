import 'package:realtime_database/src/collection/prefilter/i_prefilter.dart';
import 'package:realtime_database/src/command/query/query_command.dart';
import 'package:realtime_database/src/command/query/query_response.dart';
import 'package:realtime_database/src/connection/connection_manager.dart';
import 'package:rxdart/rxdart.dart';

class CollectionBase<T, Y> {
  List<IPrefilter> prefilters = [];

  final String collectionName;
  final String contextName;
  final ConnectionManager connectionManager;

  CollectionBase(this.collectionName, this.contextName, this.connectionManager);

  Observable<Y> snapshot() {
    QueryCommand queryCommand = QueryCommand(contextName, collectionName, prefilters);

    return connectionManager.sendCommand<QueryResponse>(queryCommand, false, false)
        .map((response) => response.result);
  }
}
