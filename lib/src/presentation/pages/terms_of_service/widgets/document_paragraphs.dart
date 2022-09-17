import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/legal_document/legal_document.dart';
import '../../../widgets/shared/document_paragraphs.dart' as shared_widget;
import '../state/terms_of_service_page_cubit.dart';

class DocumentParagraphs extends StatelessWidget {
  const DocumentParagraphs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsOfServicePageCubit, TermsOfServicePageState>(
      buildWhen: (TermsOfServicePageState previous, TermsOfServicePageState current) =>
          previous.document != current.document,
      builder: (_, TermsOfServicePageState state) {
        return state.document.maybeWhen(
          success: (LegalDocument data) => shared_widget.DocumentParagraphs(document: data),
          orElse: () => const SliverToBoxAdapter(),
        );
      },
    );
  }
}
