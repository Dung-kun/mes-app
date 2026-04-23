import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_catra_mobile/features/workers/domain/entities/worker.dart';

class WorkerFormState {
  const WorkerFormState({
    this.id,
    this.code = '',
    this.name = '',
    this.groupCode = '',
    this.status = 'active',
    this.cardCode = '',
    this.note = '',
  });

  final String? id;
  final String code;
  final String name;
  final String groupCode;
  final String status;
  final String cardCode;
  final String note;

  bool get isValid => code.trim().isNotEmpty && name.trim().isNotEmpty && groupCode.trim().isNotEmpty;

  WorkerFormState copyWith({
    String? id,
    String? code,
    String? name,
    String? groupCode,
    String? status,
    String? cardCode,
    String? note,
  }) {
    return WorkerFormState(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      groupCode: groupCode ?? this.groupCode,
      status: status ?? this.status,
      cardCode: cardCode ?? this.cardCode,
      note: note ?? this.note,
    );
  }

  factory WorkerFormState.fromWorker(Worker worker) {
    return WorkerFormState(
      id: worker.id,
      code: worker.code,
      name: worker.name,
      groupCode: worker.groupCode,
      status: worker.status,
      cardCode: worker.cardCode ?? '',
      note: worker.note,
    );
  }
}

class WorkerFormNotifier extends AutoDisposeNotifier<WorkerFormState> {
  @override
  WorkerFormState build() => const WorkerFormState();

  void seed(Worker? worker) {
    state = worker == null ? const WorkerFormState() : WorkerFormState.fromWorker(worker);
  }

  void setCode(String value) => state = state.copyWith(code: value);
  void setName(String value) => state = state.copyWith(name: value);
  void setGroupCode(String value) => state = state.copyWith(groupCode: value);
  void setStatus(String value) => state = state.copyWith(status: value);
  void setCardCode(String value) => state = state.copyWith(cardCode: value);
  void setNote(String value) => state = state.copyWith(note: value);
}

final workerFormProvider =
    AutoDisposeNotifierProvider<WorkerFormNotifier, WorkerFormState>(WorkerFormNotifier.new);
