import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/homestore_entity.dart';
import '../../domain/use_case/get_all_homestore.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllHomestoreUseCase getAllHomestoreUseCase;

  HomeBloc({required this.getAllHomestoreUseCase}) : super(HomeLoadingState()) {
    on<HomeLoadEvent>((event, emit) async{
      emit(HomeLoadingState());
      List<HomeStoreEntity> _loadedHomeStoreList = [];
      final _loadedStoreList = await getAllHomestoreUseCase(getAllHomestoreParams(query: event.homeQuery));


      emit(HomeLoadedState(loadedHomestore: _loadedHomeStoreList));
    });
  }
}