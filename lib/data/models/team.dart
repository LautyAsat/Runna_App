
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum Team{
  @JsonValue("RED")
  red,
  
  @JsonValue("BLUE")
  blue,
  
  @JsonValue("GREEN")
  green,

  @JsonValue("YELLOW")
  yellow,
}
