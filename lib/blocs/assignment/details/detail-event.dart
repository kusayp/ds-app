import 'package:dsapp/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class AssignmentDetailEvent extends Equatable {
  AssignmentDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchingSignedUrlEvent extends AssignmentDetailEvent {
  final AssignmentModel assignment;

  FetchingSignedUrlEvent({this.assignment});
  @override
  List<Object> get props => [assignment];
}