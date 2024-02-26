part of 'delete_cake_bloc.dart';

sealed class DeleteCakeEvent extends Equatable {
  const DeleteCakeEvent();

  @override
  List<Object?> get props => [];
}

class DeleteCakeRequested extends DeleteCakeEvent {
  final String cakeId;

  const DeleteCakeRequested(this.cakeId);

  @override
  List<Object?> get props => [cakeId];
}
