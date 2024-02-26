import 'package:bloc/bloc.dart';
import 'package:cake_repository/cake_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_cake_event.dart';
part 'delete_cake_state.dart';

class DeleteCakeBloc extends Bloc<DeleteCakeEvent, DeleteCakeState> {
  final CakeRepo cakeRepo;

  DeleteCakeBloc(this.cakeRepo) : super(DeleteCakeInitial());

  Stream<DeleteCakeState> mapEventToState(DeleteCakeEvent event) async* {
    if (event is DeleteCakeRequested) {
      yield* _mapDeleteCakeRequestedToState(event);
    }
  }

  Stream<DeleteCakeState> _mapDeleteCakeRequestedToState(
      DeleteCakeRequested event) async* {
    yield DeleteCakeLoading();
    try {
      await cakeRepo.deleteCake(event.cakeId);
      yield DeleteCakeSuccess();
    } catch (_) {
      yield DeleteCakeFailure();
    }
  }
}
