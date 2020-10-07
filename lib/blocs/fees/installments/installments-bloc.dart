import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class InstallmentsBloc extends Bloc<InstallmentsEvent, InstallmentsState> {
  final FeesRepository repository;
  InstallmentsBloc({this.repository}) : super(InstallmentsEmptyState());

  @override
  void onTransition(Transition<InstallmentsEvent, InstallmentsState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<InstallmentsState> mapEventToState(InstallmentsEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingFeesEvent){
      yield InstallmentsLoadingState();
      try{
        String user = await sharedPreferences.getUserDetails();
        LoginResponse loginResponse = LoginResponse.fromJson(user);
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final FeesPageData response = await repository.getFees(schoolId);
        yield InstallmentsLoadedState(feesPageData: response);
      }
      catch(_){
        yield InstallmentsErrorState();
      }
    }
  }

}