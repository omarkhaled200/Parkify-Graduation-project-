import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient client;

  Future<void> connect(String server, int port, String clientId,
      {required String username,
      required String password,
      bool useSecure = true,
      bool allowBadCert = false}) async {
    client = MqttServerClient(server, clientId);

    client.port = port;
    client.secure = useSecure;
    client.setProtocolV311();
    client.keepAlivePeriod = 20;
    client.logging(on: true);
    // client.autoReconnect = true;
    client.resubscribeOnAutoReconnect = true;

    if (useSecure && allowBadCert) {
      client.onBadCertificate = (_) => true;
    }

    final connMess = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .authenticateAs(username, password)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } catch (e) {
      // print('Connection failed: $e');
      client.disconnect();
      rethrow;
    }
  }

  void subscribe(String topic, {MqttQos qos = MqttQos.atLeastOnce}) {
    client.subscribe(topic, qos);
  }

  void publish(String topic, String message,
      {MqttQos qos = MqttQos.atLeastOnce}) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);
    client.publishMessage(topic, qos, builder.payload!);
  }

  Stream<String> getMessages(String topic) {
    return client.updates!.expand((List<MqttReceivedMessage<MqttMessage>> c) {
      final recMess = c[0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      return [pt];
    });
  }

  void disconnect() {
    client.disconnect();
  }

  void onDisconnected() {
    print('MQTT Disconnected');
  }
}
