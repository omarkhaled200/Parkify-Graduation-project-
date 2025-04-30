part of 'deactivate_blocker_cubit.dart';

sealed class DeactivateBlockerState extends Equatable {
  const DeactivateBlockerState();

  @override
  List<Object> get props => [];
}

final class DeactivateBlockerInitial extends DeactivateBlockerState {}

final class DeactivateBlockerLoading extends DeactivateBlockerState {}

final class DeactivateBlockerFailure extends DeactivateBlockerState {
  final String errmessage;

  const DeactivateBlockerFailure({required this.errmessage});
}

final class DeactivateBlockerSuccess extends DeactivateBlockerState {
  final String output;

  const DeactivateBlockerSuccess({required this.output});
}
