import 'package:bloc/bloc.dart';
import 'package:cake_repository/cake_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_cake_event.dart';
part 'get_cake_state.dart';

class GetCakeBloc extends Bloc<GetCakeEvent, GetCakeState> {
  final CakeRepo _cakeRepo;

  GetCakeBloc(this._cakeRepo) : super(GetCakeInitial()) {
    on<GetCake>((event, emit) async {
      emit(GetCakeLoading());
      try {
        List<Cake> cakes = await _cakeRepo.getCakes();
        emit(GetCakeSuccess(cakes));
      } catch (e) {
        emit(GetCakeFailure());
      }
    });
  }
}
