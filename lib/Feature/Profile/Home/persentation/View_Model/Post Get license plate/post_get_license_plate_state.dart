part of 'post_get_license_plate_cubit.dart';

sealed class PostGetLicensePlateState extends Equatable {
  const PostGetLicensePlateState();

  @override
  List<Object> get props => [];
}

final class PostGetLicensePlateInitial extends PostGetLicensePlateState {}

final class PostGetLicensePlateLoading extends PostGetLicensePlateState {}

final class PostGetLicensePlateFailure extends PostGetLicensePlateState {
  final String errmessage;

  PostGetLicensePlateFailure({required this.errmessage});
}

final class PostGetLicensePlateSuccess extends PostGetLicensePlateState {
  final String plate;

  PostGetLicensePlateSuccess({required this.plate});
}
