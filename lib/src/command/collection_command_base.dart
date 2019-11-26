import 'package:realtime_database/src/command/command_base.dart';

abstract class CollectionCommandBase extends CommandBase {
  String collectionName;
  String contextName;

  CollectionCommandBase(String commandType, String collectionName, String contextName) : super(commandType) {
    this.collectionName = collectionName;
    this.contextName = contextName;
  }
}
