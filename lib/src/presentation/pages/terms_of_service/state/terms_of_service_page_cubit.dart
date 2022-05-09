import 'package:common_models/common_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/manager/legal_documents_provider.dart';
import '../../../../domain/model/legal_document/legal_document.dart';

part 'terms_of_service_page_cubit.freezed.dart';

@freezed
class TermsOfServicePageState with _$TermsOfServicePageState {
  const factory TermsOfServicePageState({
    required DataState<FetchFailure, LegalDocument> document,
  }) = _TermsOfServicePageState;

  factory TermsOfServicePageState.initial() => TermsOfServicePageState(
        document: DataState<FetchFailure, LegalDocument>.idle(),
      );
}

@injectable
class TermsOfServicePageCubit extends Cubit<TermsOfServicePageState> {
  TermsOfServicePageCubit(
    this._legalDocumentsProvider,
  ) : super(TermsOfServicePageState.initial());

  final LegalDocumentsProvider _legalDocumentsProvider;

  Future<void> init() async {
    emit(state.copyWith(document: DataState<FetchFailure, LegalDocument>.loading()));
    final Either<FetchFailure, LegalDocument> document =
        await _legalDocumentsProvider.getTermsOfService();
    emit(state.copyWith(document: DataState<FetchFailure, LegalDocument>.fromEither(document)));
  }
}
