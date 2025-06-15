part of 'post_add_license_plate_cubit.dart';

sealed class PostAddLicensePlateState extends Equatable {
  const PostAddLicensePlateState();

  @override
  List<Object> get props => [];
}

final class PostAddLicensePlateInitial extends PostAddLicensePlateState {}

final class PostAddLicensePlateLoading extends PostAddLicensePlateState {}

final class PostAddLicensePlateFailure extends PostAddLicensePlateState {
  final String errmessage;

  PostAddLicensePlateFailure({required this.errmessage});
}

final class PostAddLicensePlateSuccess extends PostAddLicensePlateState {
  final String message;

  PostAddLicensePlateSuccess({required this.message});
}
