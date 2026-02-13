// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
  (json['candidates'] as List<dynamic>?)
      ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
      .toList(),
  json['usageMetadata'] == null
      ? null
      : UsageMetadata.fromJson(json['usageMetadata'] as Map<String, dynamic>),
  json['modelVersion'] as String?,
  json['responseId'] as String?,
);

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'usageMetadata': instance.usageMetadata,
      'modelVersion': instance.modelVersion,
      'responseId': instance.responseId,
    };

Candidate _$CandidateFromJson(Map<String, dynamic> json) => Candidate(
  json['content'] == null
      ? null
      : Content.fromJson(json['content'] as Map<String, dynamic>),
  json['finishReason'] as String?,
  (json['index'] as num?)?.toInt(),
);

Map<String, dynamic> _$CandidateToJson(Candidate instance) => <String, dynamic>{
  'content': instance.content,
  'finishReason': instance.finishReason,
  'index': instance.index,
};

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
  (json['parts'] as List<dynamic>?)
      ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
      .toList(),
  json['role'] as String?,
);

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
  'parts': instance.parts,
  'role': instance.role,
};

Part _$PartFromJson(Map<String, dynamic> json) =>
    Part(json['text'] as String?, json['thoughtSignature'] as String?);

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
  'text': instance.text,
  'thoughtSignature': instance.thoughtSignature,
};

UsageMetadata _$UsageMetadataFromJson(Map<String, dynamic> json) =>
    UsageMetadata(
      (json['promptTokenCount'] as num?)?.toInt(),
      (json['candidatesTokenCount'] as num?)?.toInt(),
      (json['totalTokenCount'] as num?)?.toInt(),
      (json['promptTokensDetails'] as List<dynamic>?)
          ?.map((e) => PromptTokenDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['thoughtsTokenCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UsageMetadataToJson(UsageMetadata instance) =>
    <String, dynamic>{
      'promptTokenCount': instance.promptTokenCount,
      'candidatesTokenCount': instance.candidatesTokenCount,
      'totalTokenCount': instance.totalTokenCount,
      'promptTokensDetails': instance.promptTokensDetails,
      'thoughtsTokenCount': instance.thoughtsTokenCount,
    };

PromptTokenDetail _$PromptTokenDetailFromJson(Map<String, dynamic> json) =>
    PromptTokenDetail(
      json['modality'] as String?,
      (json['tokenCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PromptTokenDetailToJson(PromptTokenDetail instance) =>
    <String, dynamic>{
      'modality': instance.modality,
      'tokenCount': instance.tokenCount,
    };
