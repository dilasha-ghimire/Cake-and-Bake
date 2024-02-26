part of 'get_cake_bloc.dart';

sealed class GetCakeState extends Equatable {
  const GetCakeState();

  @override
  List<Object> get props => [];
}

final class GetCakeInitial extends GetCakeState {}

final class GetCakeFailure extends GetCakeState {}

final class GetCakeLoading extends GetCakeState {}

final class GetCakeSuccess extends GetCakeState {
  final List<Cake> cakes;

  const GetCakeSuccess(this.cakes);

  @override
  List<Object> get props => [cakes];
}
