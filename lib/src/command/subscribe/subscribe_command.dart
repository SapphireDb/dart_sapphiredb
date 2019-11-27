import 'package:json_annotation/json_annotation.dart';
import 'package:realtime_database/src/collection/prefilter/i_prefilter.dart';
import 'package:realtime_database/src/command/query/query_command.dart';

part 'subscribe_command.g.dart';

@JsonSerializable()
class SubscribeCommand extends QueryCommand {
  SubscribeCommand(String collectionName, String contextName, List<IPrefilter> prefilters) : super(collectionName, contextName, prefilters) {
    this.commandType = "SubscribeCommand";
  }

  @override
  Map<String, dynamic> toJson() => _$SubscribeCommandToJson(this);
}
