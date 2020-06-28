import 'package:recyclomedia/api/Events/event.provider.dart';
import 'package:flutter/material.dart';
import 'package:recyclomedia/models/event.model.dart';
import '../widgets/eventsCard.dart';
import 'login.page.dart';

class EventsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  EventProvider _eventProvider = EventProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final pageHeader = new Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Events",
            style: TextStyle(
                fontFamily: 'SilkScreen',
                fontWeight: FontWeight.w700,
                color: Colors.white),
            textScaleFactor: 2,
          ),
          Text(
            "Discover the events near you...",
            style: TextStyle(
                fontFamily: 'SilkScreen',
                //fontWeight: FontWeight.w700,
                color: Colors.white),
            textScaleFactor: 1,
          )
        ]));

    final cardContainer = Container(
      margin: EdgeInsets.only(left: 18.0, right: 18.0),
      child: FutureBuilder(
        future: _eventProvider.getEventData,
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
              break;

            case ConnectionState.waiting:
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
              break;

            case ConnectionState.active:
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
              break;

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                  child: Text("Something went wrong!"),
                );
              } else {
                return BuildList(eventData: snapshot.data);
              }
              break;
          }
          return Container();
        },
      ),
    );

    return new Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
          children: <Widget>[pageHeader, cardContainer],
        )),
      ),
    );
  }
}

class BuildList extends StatelessWidget {
  const BuildList({Key key, this.eventData}) : super(key: key);

  final List<Event> eventData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: eventData.length,
        itemBuilder: (context, index) {
          return EventsCard(eventData[index].name, eventData[index].banner);
        },
      ),
    );
  }
}
