part of 'save_cake_bloc.dart';

sealed class SaveCakeEvent extends Equatable {
  const SaveCakeEvent();

  @override
  List<Object> get props => [];
}

class SaveCake extends SaveCakeEvent {
  final Cake cake;

  const SaveCake(this.cake);

  @override
  List<Object> get props => [cake];
}
