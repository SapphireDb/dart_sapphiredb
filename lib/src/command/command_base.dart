import 'package:uuid/uuid.dart';

abstract class CommandBase {
  static Uuid uuid = Uuid();

  String commandType;
  String referenceId;

  CommandBase(String commandType) {
    this.commandType = commandType;
    this.referenceId = uuid.v4();
  }

  Map<String, dynamic> toJson();
}
