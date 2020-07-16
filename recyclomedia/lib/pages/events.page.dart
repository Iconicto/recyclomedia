import 'package:recyclomedia/api/Events/event.provider.dart';
import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';
import 'package:recyclomedia/models/event.model.dart';
import 'package:recyclomedia/pages/event.page.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:recyclomedia/widgets/events.card.dart';
import 'package:recyclomedia/widgets/hero_banner.widget.dart';

const clicksound = "audio/click.wav";

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

  Widget _buildHeroBannerContent() {
    return Positioned(
      bottom: MediaQuery.of(context).viewPadding.top < 0 ? 65 : 20,
      left: 25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            "Events",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Viewport
    final vw = MediaQuery.of(context).size.width;

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
                child: Center(
                    child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/loading.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
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
                  child: Center(
                      child: Container(
                    height: 150.0,
                    width: vw,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/error.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
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

    return Column(
      children: [
        HeroBanner(imageURI: Images.sunset, child: _buildHeroBannerContent()),
        Expanded(
          flex: MediaQuery.of(context).size.height > 680 ? 1 : 2,
          child: SingleChildScrollView(child: cardContainer),
        ),
      ],
    );
  }
}

const alarmAudioPath = "click_sound.mp3";

class BuildList extends StatelessWidget {
  static AudioCache player = new AudioCache();

  const BuildList({Key key, this.eventData}) : super(key: key);

  final List<Event> eventData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: eventData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              player.play(clicksound);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetails(
                        eventName: eventData[index].name,
                        eventBanner: eventData[index].banner,
                        eventOrg: eventData[index].managedBy.name,
                        eventDate:
                            eventData[index].time.toString().split("T")[0],
                        eventTime: eventData[index].duration,
                        eventDes: eventData[index].content,
                        eventOrgBanner: eventData[index].managedBy.orgPicture,
                        eventOrgEmail: eventData[index].managedBy.email),
                  ));
            },
            child:
                EventsCard(eventData[index].name, "", eventData[index].banner),
          );
        },
      ),
    );
  }
}
