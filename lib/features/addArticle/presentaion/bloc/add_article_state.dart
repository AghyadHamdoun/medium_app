import 'package:equatable/equatable.dart';

class AddArticleState extends Equatable {
  // 1
  final bool showLoading;

  const AddArticleState({
    //2
    this.showLoading = false,
  });

  AddArticleState copyWith({
    // 3

    final bool? showLoading,
  }) {
    return AddArticleState(
      //4
      showLoading: showLoading ?? this.showLoading,
    );
  }

  @override
  List<Object?> get props =>
      //5
      [showLoading];
}
