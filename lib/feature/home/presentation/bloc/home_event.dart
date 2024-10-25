import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLoadEvent extends HomeEvent{
  const HomeLoadEvent();

  @override
  List<Object> get props => throw UnimplementedError();

  get homeQuery => null;
  
}
class SearchHome extends HomeLoadEvent {
  final String homeQuery;

  const SearchHome(this.homeQuery);


}