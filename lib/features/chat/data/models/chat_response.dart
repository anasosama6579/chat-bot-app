import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  final List<Candidate>? candidates;
  final UsageMetadata? usageMetadata;
  final String? modelVersion;
  final String? responseId;

  ChatResponse(
    this.candidates,
    this.usageMetadata,
    this.modelVersion,
    this.responseId,
  );

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}

@JsonSerializable()
class Candidate {
  final Content? content;
  final String? finishReason;
  final int? index;

  Candidate(this.content, this.finishReason, this.index);

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);
}

@JsonSerializable()
class Content {
  final List<Part>? parts;
  final String? role;

  Content(this.parts, this.role);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

@JsonSerializable()
class Part {
  final String? text;
  final String? thoughtSignature;

  Part(this.text, this.thoughtSignature);

  Map<String, dynamic> toJson() => _$PartToJson(this);
  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);
}

@JsonSerializable()
class UsageMetadata {
  final int? promptTokenCount;
  final int? candidatesTokenCount;
  final int? totalTokenCount;
  final List<PromptTokenDetail>? promptTokensDetails;
  final int? thoughtsTokenCount;

  UsageMetadata(
    this.promptTokenCount,
    this.candidatesTokenCount,
    this.totalTokenCount,
    this.promptTokensDetails,
    this.thoughtsTokenCount,
  );

  Map<String, dynamic> toJson() => _$UsageMetadataToJson(this);
  factory UsageMetadata.fromJson(Map<String, dynamic> json) =>
      _$UsageMetadataFromJson(json);
}

@JsonSerializable()
class PromptTokenDetail {
  final String? modality;
  final int? tokenCount;

  PromptTokenDetail(this.modality, this.tokenCount);

  Map<String, dynamic> toJson() => _$PromptTokenDetailToJson(this);
  factory PromptTokenDetail.fromJson(Map<String, dynamic> json) =>
      _$PromptTokenDetailFromJson(json);
}
