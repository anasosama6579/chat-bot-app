import 'package:json_annotation/json_annotation.dart';

part 'chat_request_body.g.dart';

@JsonSerializable()
class ChatRequestBody {
  final List<Content>? contents;

  ChatRequestBody({required this.contents});

  Map<String,dynamic> toJson() => _$ChatRequestBodyToJson(this);
  factory ChatRequestBody.fromJson(Map<String,dynamic> json) => _$ChatRequestBodyFromJson(json);


}

@JsonSerializable()
class Content {
  final String role;
  final List<Part>? parts;

  Content({required this.parts, required this.role});
  Map<String,dynamic> toJson() => _$ContentToJson(this);
  factory Content.fromJson(Map<String,dynamic> json) => _$ContentFromJson(json);
}

@JsonSerializable()
class Part{
  final String? text;

  Part({required this.text});
  Map<String,dynamic> toJson() => _$PartToJson(this);
  factory Part.fromJson(Map<String,dynamic> json) => _$PartFromJson(json);
}