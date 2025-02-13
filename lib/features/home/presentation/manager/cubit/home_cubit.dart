import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/home/data/models/get_task_model.dart';
import 'package:task_app/features/home/data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  GetTaskModel getTaskModel = GetTaskModel();
  Future<void> getTasks() async {
    emit(HomeLoadingState());
    var response = await _homeRepo.getTasks();
    response.fold((l) {
      emit(HomeFailureState(l.message));
    }, (r) {
      getTaskModel = GetTaskModel.fromJson(r);
      emit(HomeSuccessState(getTaskModel));
    });
  }
}
