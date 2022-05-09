import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/legal_document/legal_document.dart';
import '../../../widgets/shared/caption_last_updated.dart' as shared_widget;
import '../state/terms_of_service_page_cubit.dart';

class CaptionLastUpdated extends StatelessWidget {
  const CaptionLastUpdated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsOfServicePageCubit, TermsOfServicePageState>(
      buildWhen: (TermsOfServicePageState previous, TermsOfServicePageState current) =>
      previous.document != current.document,
      builder: (_, TermsOfServicePageState state) {
        return state.document.maybeWhen(
          success: (LegalDocument data) => data.updatedAt != null
              ? shared_widget.CaptionLastUpdated(lastUpdatedAt: data.updatedAt!)
              : const SizedBox.shrink(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
