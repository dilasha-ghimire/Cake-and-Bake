part of 'get_cake_bloc.dart';

sealed class GetCakeEvent extends Equatable {
  const GetCakeEvent();

  @override
  List<Object> get props => [];
}

class GetCake extends GetCakeEvent {}
