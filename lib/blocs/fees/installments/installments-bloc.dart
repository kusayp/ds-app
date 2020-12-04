import 'package:bloc/bloc.dart';
import 'package:dsapp/blocs/blocs.dart';
import 'package:dsapp/exceptions/exceptions.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/repositories/repositories.dart';
import 'package:dsapp/utils/shared-preference.dart';

class InstallmentsBloc extends Bloc<InstallmentsEvent, InstallmentsState> {
  final FeesRepository repository;
  InstallmentsBloc({this.repository}) : super(InstallmentsInitialState());

  @override
  void onTransition(Transition<InstallmentsEvent, InstallmentsState> transition) {
    print(transition);    super.onTransition(transition);
  }

  @override
  Stream<InstallmentsState> mapEventToState(InstallmentsEvent event) async* {
    LocalStorage sharedPreferences = LocalStorage();
    if(event is FetchingInstallmentsEvent){
      yield InstallmentsLoadingState();
      try{
        var schoolId = await sharedPreferences.getSharedPreference("schoolId");
        final InstallmentList response = await repository.getInstallments(schoolId, event.feesId);
        final PaymentList paymentListResponse = await repository.getPaymentList(schoolId, event.classId, event.userId, event.feesId);
        if (response.list.isEmpty && paymentListResponse.list.isEmpty){
          yield InstallmentsEmptyState();
        }else{
        yield InstallmentsLoadedState(installmentList: response.list[0], paymentList: paymentListResponse);
        }
      }
      on ApiException catch(e){
        yield InstallmentsErrorState(e.getMessage());
      }
    }
  }

}