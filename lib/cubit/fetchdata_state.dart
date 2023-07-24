part of 'fetchdata_cubit.dart';

@immutable
abstract class FetchDataState {}

class FetchDataInitial extends FetchDataState {}

class FetchDataLoading extends FetchDataState {}

class FetchDataError extends FetchDataState {
  String message ;
  FetchDataError(this.message);

}

class FetchData extends FetchDataState {
  List<GetPostModel> dataList=[];
  FetchData(this.dataList);
}
