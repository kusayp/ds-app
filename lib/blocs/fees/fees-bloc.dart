import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class FeesBloc extends Bloc<FeesEvent, FeesState> {
  final FeesRepository repository;
  FeesBloc({this.repository}) : super(FeesInitialState());

  @override
  void onTransition(Transition<FeesEvent, FeesState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<FeesState> mapEventToState(FeesEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if(event is FetchingFeesEvent){
      yield FeesLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final FeesPageData response = await repository.getFees(schoolId, event.classId, event.classId);
        if(response.results.isEmpty){
          yield FeesEmptyState();
        }else{
        yield FeesLoadedState(feesPageData: response);
        }
      }
      on ApiException catch(e){
        yield FeesErrorState(e.getMessage());
      }
      on SocketException catch(_){
        yield FeesErrorState("No internet connection");
      }
    }
  }

}