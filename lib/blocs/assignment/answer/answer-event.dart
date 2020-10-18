import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AnswerEvent extends Equatable {
  AnswerEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchingAnswerEvent extends AnswerEvent {
  final int assignmentId;
  FetchingAnswerEvent({this.assignmentId});
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AssignmentAnswerEvent extends AnswerEvent {
  final int assignmentId;
  final int student;
  final String description;
  final File file;
  final String attachment;
  AssignmentAnswerEvent({this.student, this.description, this.file, this.attachment, this.assignmentId});
  @override
  // TODO: implement props
  List<Object> get props => [];
}