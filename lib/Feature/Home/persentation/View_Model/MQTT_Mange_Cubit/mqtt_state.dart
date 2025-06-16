// تحديث الـ States
part of 'mqtt_cubit.dart';

abstract class MqttState {}

class MqttInitial extends MqttState {}

class MqttLoading extends MqttState {}

class MqttConnected extends MqttState {}

class MqttMessageReceived extends MqttState {
  final String message;
  MqttMessageReceived(this.message);
}

class MqttDisconnected extends MqttState {}

class MqttError extends MqttState {
  final String error;
  MqttError(this.error);
}
