import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

abstract class AddAssignmentEvent extends Equatable {
  const AddAssignmentEvent();

}

class ClassDropdownEvent extends AddAssignmentEvent {
  final String classId;
  final String teacherId;

  ClassDropdownEvent({this.teacherId, this.classId});
  @override
  List<Object> get props => [classId, teacherId];
}

class ClassAssignmentSaveEvent extends AddAssignmentEvent {
  final int classId;
  final int teacherId;
  final String title;
  final int subjectId;
  final DateTime dueDate;
  final String description;
  final PlatformFile file;
  final String attachment;

  ClassAssignmentSaveEvent({this.attachment, this.title, this.subjectId, this.dueDate, this.description, this.file, this.teacherId, this.classId});
  @override
  List<Object> get props => [classId, teacherId, subjectId, dueDate, description, file, title];
}
