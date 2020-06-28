import 'package:recyclomedia/models/event.model.dart';
import 'package:recyclomedia/api/Events/event.service.dart';

class EventProvider {
  EventService _eventService = EventService();
  Future<List<Event>> get getEventData => _eventService.getEventData();
}
