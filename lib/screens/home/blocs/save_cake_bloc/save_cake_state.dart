part of 'save_cake_bloc.dart';

sealed class SaveCakeState extends Equatable {
  const SaveCakeState();

  @override
  List<Object> get props => [];
}

class SaveCakeInitial extends SaveCakeState {}

class SaveCakeLoading extends SaveCakeState {}

class SaveCakeSuccess extends SaveCakeState {}

class SaveCakeFailure extends SaveCakeState {}
