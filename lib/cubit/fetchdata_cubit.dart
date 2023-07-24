import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/get_post_model.dart';
import '../repositories/repo.dart';

part 'fetchdata_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  Repo repo;
  FetchDataCubit(this.repo) : super(FetchDataInitial());

  Future<void> fetchPost()async{
    try{emit(FetchDataLoading());
    final data=  await repo.fetchData();
    emit(FetchData(data));

    }catch(e){
      emit(FetchDataError(e.toString()));
    }
  }
}
