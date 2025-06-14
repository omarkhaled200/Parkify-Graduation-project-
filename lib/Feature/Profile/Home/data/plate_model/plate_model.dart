import 'package:equatable/equatable.dart';

class PlateModel extends Equatable {
  final int? id;
  final String? plate;

  const PlateModel({this.id, this.plate});

  factory PlateModel.fromJson(Map<String, dynamic> json) => PlateModel(
        id: json['id'] as int?,
        plate: json['plate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'plate': plate,
      };

  @override
  List<Object?> get props => [id, plate];
}
