import 'dart:convert';

import 'package:recyclomedia/models/event.model.dart';
import 'package:dio/dio.dart' as http_dio;

class EventService {
  http_dio.Dio dio = http_dio.Dio();

  Future<List<Event>> getEventData() async {
    http_dio.Response response;
    response = await dio.get("https://recyclomedia.iconicto.com/api/events/");

    if (response.statusCode == 200) {
      final List rawData = jsonDecode(jsonEncode(response.data));
      List<Event> listEventsModel =
          rawData.map((f) => Event.fromJson(f)).toList();
      return listEventsModel;
    } else {
      return null;
    }
  }
}
