import 'package:freezed_annotation/freezed_annotation.dart';

part 'legal_document_paragraph.freezed.dart';

@freezed
class LegalDocumentParagraph with _$LegalDocumentParagraph {
  const factory LegalDocumentParagraph({
    required String title,
    required String body,
  }) = _LegalDocumentParagraph;
}
