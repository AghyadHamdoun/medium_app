import 'package:equatable/equatable.dart';

abstract class AddArticleEvent extends Equatable {
  const AddArticleEvent();

  @override
  List<Object> get props => [];
}

class ShowLoadingEvent extends AddArticleEvent {

  const ShowLoadingEvent();
}






