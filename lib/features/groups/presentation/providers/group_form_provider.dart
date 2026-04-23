import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/groups/domain/entities/group.dart';

class GroupFormState {
  const GroupFormState({
    this.id,
    this.code = '',
    this.description = '',
    this.note = '',
  });

  final String? id;
  final String code;
  final String description;
  final String note;

  bool get isValid => code.trim().isNotEmpty && description.trim().isNotEmpty;

  GroupFormState copyWith({
    String? id,
    String? code,
    String? description,
    String? note,
  }) {
    return GroupFormState(
      id: id ?? this.id,
      code: code ?? this.code,
      description: description ?? this.description,
      note: note ?? this.note,
    );
  }

  factory GroupFormState.fromGroup(Group group) {
    return GroupFormState(
      id: group.id,
      code: group.code,
      description: group.description,
      note: group.note,
    );
  }
}

class GroupFormNotifier extends AutoDisposeNotifier<GroupFormState> {
  @override
  GroupFormState build() => const GroupFormState();

  void seed(Group? group) {
    state = group == null ? const GroupFormState() : GroupFormState.fromGroup(group);
  }

  void setCode(String value) => state = state.copyWith(code: value);
  void setDescription(String value) => state = state.copyWith(description: value);
  void setNote(String value) => state = state.copyWith(note: value);
}

final groupFormProvider =
    AutoDisposeNotifierProvider<GroupFormNotifier, GroupFormState>(GroupFormNotifier.new);
