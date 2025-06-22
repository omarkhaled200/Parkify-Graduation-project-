import 'dart:convert';

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

        print('📥 MQTT Message: $pt'); // لازم تتأكد من شكل الرسالة هنا

        try {
          // ✅ decode JSON أولًا
          final parsedJson = jsonDecode(pt); // pt لازم يكون: {"message":"2 2"}
          final message = parsedJson["message"]; // = "2 2"
          emit(MqttMessageReceived(message));
        } catch (e) {
          emit(MqttError("JSON parse error: $e"));
        }
      });
    } catch (e) {
      emit(MqttError(e.toString()));
    }
  }
}
