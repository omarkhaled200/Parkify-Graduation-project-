import 'package:bloc/bloc.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:parkify/Core/utlis/Functions/MQTT%20Service.dart';

part 'mqtt_state.dart';

class MqttCubit extends Cubit<MqttState> {
  final MqttService mqttService;

  MqttCubit(this.mqttService) : super(MqttInitial());

  Future<void> connect({
    required String server,
    required int port,
    required String clientId,
    required String topic,
    required String username,
    required String password,
  }) async {
    emit(MqttLoading());
    try {
      await mqttService.connect(
        server,
        port,
        clientId,
        username: username,
        password: password,
      );

      mqttService.subscribe(topic, qos: MqttQos.atMostOnce);
      emit(MqttConnected());

      mqttService.client.updates!.listen((c) {
        final recMess = c[0].payload as MqttPublishMessage;
        final pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        if (!isClosed) {
          emit(MqttMessageReceived(pt));
        }
      });
    } catch (e) {
      emit(MqttError(e.toString()));
    }
  }
}

// class MqttState {
//   final String? receivedValue;

//   MqttState({this.receivedValue});
// }

// class MqttCubit extends Cubit<MqttState> {
//   MqttCubit() : super(MqttState());

//   final _mqtt = MqttService();

//   Future<void> connectAndSubscribe(String topic) async {
//     await _mqtt.connect();

//     _mqtt.client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final recMess = c[0].payload as MqttPublishMessage;
//       final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

//       print('🚀 Received: $pt');
//       emit(MqttState(receivedValue: pt)); // نحفظ القيمة الجديدة
//     });

//     _mqtt.subscribeToTopic(topic);
//   }
// }
