import 'package:bloc/bloc.dart';
import 'package:cake_repository/cake_repository.dart';
import 'package:equatable/equatable.dart';

part 'save_cake_event.dart';
part 'save_cake_state.dart';

class SaveCakeBloc extends Bloc<SaveCakeEvent, SaveCakeState> {
  final CakeRepo _cakeRepo;
  SaveCakeBloc(this._cakeRepo) : super(SaveCakeInitial());

  Stream<SaveCakeState> mapEventToState(SaveCakeEvent event) async* {
    if (event is SaveCake) {
      yield* _mapSaveCakeToState(event);
    }
  }

  Stream<SaveCakeState> _mapSaveCakeToState(SaveCake event) async* {
    yield SaveCakeLoading();
    try {
      await _cakeRepo.saveCake(event.cake);
      yield SaveCakeSuccess();
    } catch (_) {
      yield SaveCakeFailure();
    }
  }
}
