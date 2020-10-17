import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/repositories/repositories.dart';

class AssignmentDetailBloc extends Bloc<AssignmentDetailEvent, AssignmentDetailState> {
  final AssignmentRepository repository;
  AssignmentDetailBloc({this.repository}) : super(AssignmentDetailEmptyState());

  @override
  void onTransition(Transition<AssignmentDetailEvent, AssignmentDetailState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<AssignmentDetailState> mapEventToState(AssignmentDetailEvent event) async* {
    // TODO: implement mapEventToState
    if(event is FetchingAssignmentEvent){
      yield AssignmentDetailLoadingState();
      try{
      }
      catch(_){
        yield AssignmentDetailErrorState();
      }
    }
  }

}