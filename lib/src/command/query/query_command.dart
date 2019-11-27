import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/collection/prefilter/i_prefilter.dart';
import 'package:realtime_database/src/command/collection_command_base.dart';

part 'query_command.g.dart';

@JsonSerializable()
class QueryCommand extends CollectionCommandBase {
  List<IPrefilter> prefilters;

  QueryCommand(String collectionName, String contextName, List<IPrefilter> prefilters) : super("QueryCommand", collectionName, contextName) {
    this.prefilters = prefilters;
  }

  @override
  Map<String, dynamic> toJson() => _$QueryCommandToJson(this);
}
