part of 'delete_cake_bloc.dart';

sealed class DeleteCakeState extends Equatable {
  const DeleteCakeState();

  @override
  List<Object> get props => [];
}

class DeleteCakeInitial extends DeleteCakeState {}

class DeleteCakeLoading extends DeleteCakeState {}

class DeleteCakeSuccess extends DeleteCakeState {}

class DeleteCakeFailure extends DeleteCakeState {}
