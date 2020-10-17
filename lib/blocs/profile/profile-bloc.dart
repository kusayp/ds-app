import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ExamsRepository repository;
  ProfileBloc({this.repository}) : super(ProfileEmptyState());

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    // TODO: implement mapEventToState
    if(event is FetchingExamsEvent){
      yield ProfileLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final ExamsPageData response = await repository.getExams(schoolId);
        yield ProfileLoadedState(examsPageData: response);
      }
      catch(_){
        yield ProfileErrorState();
      }
    }
  }

}