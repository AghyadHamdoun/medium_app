import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_event.dart';
import 'package:DevLogger/features/addArticle/presentaion/bloc/add_article_state.dart';

class AddArticleBloc extends Bloc<AddArticleEvent, AddArticleState> {
  AddArticleBloc()
      : super(const AddArticleState()) {
    on<ShowLoadingEvent>((event, emit) async {
      emit(state.copyWith(showLoading: !state.showLoading));


      // emit(state.copyWith(brandsTermsState: RequestState.loading));
      //
      // final result = await getTermsUseCase(TermsParameters(
      //     id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      // result.fold(
      //         (l) => emit(state.copyWith(
      //       //state
      //         brandsTermsMessage: l.message,
      //         brandsTermsState: RequestState.error)), (r) {
      //   String terms = jsonEncode(r);
      //   Preferences.saveBrands(terms);
      //   emit(state.copyWith(
      //     //state
      //       brandsTerms: r,
      //       brandsTermsState: RequestState.loaded));
      // });
    });
  }
}