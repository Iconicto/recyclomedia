import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Viewport
    final vh = MediaQuery.of(context).size.height;
    final vw = MediaQuery.of(context).size.width;

    final pagerHeader = Container(
      height: 0.30 * vh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://cdn.iconicto.com/recyclomedia/media/event_banners/2020/06/28/RS7824_ThinkstockPhotos-506316644-hig.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );

    final eventOverview = Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Beach Cleanup 2020",
            style: TextStyle(
                fontFamily: 'SilkScreen',
                fontWeight: FontWeight.w700,
                color: Colors.black),
            textScaleFactor: 2,
          ),
          Text(
            "by United Nations",
            style: TextStyle(
                fontFamily: 'SilkScreen',
                fontWeight: FontWeight.w700,
                color: Colors.black),
            textScaleFactor: 1,
          ),
          SizedBox(height: 30.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: Color(0xFFE93B55),
                        size: 30.0,
                      ),
                      Text(
                        "21/12/1111",
                        style: TextStyle(
                            fontFamily: 'SilkScreen',
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                        textScaleFactor: 0.9,
                      ),
                    ]),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.query_builder,
                      color: Color(0xFFE93B55),
                      size: 30.0,
                    ),
                    Text(
                      "17.00PM",
                      style: TextStyle(
                          fontFamily: 'SilkScreen',
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                      textScaleFactor: 0.9,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );

    final eventDescription = Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque turpis odio, posuere vel dapibus at, faucibus vitae magna. Aenean velit lectus, commodo vitae posuere non, pharetra vitae neque. Maecenas quis pretium nisl. Integer blandit massa urna, dignissim pellentesque lacus efficitur ac. Suspendisse fringilla nec ante vel tincidunt. Nulla facilisi. Duis semper quam sed purus vulputate, vel consectetur mauris tincidunt. Nam tempor vitae lectus non molestie. Donec vel nisl gravida, mattis ex a, semper ligula. Curabitur vel elit ac elit lobortis aliquet. Fusce iaculis neque id posuere malesuada. Donec fringilla lectus orci, eu egestas risus egestas sit amet. Mauris scelerisque lobortis posuere. Nam volutpat cursus nulla, et tristique tortor porta et. Sed sodales, turpis sit amet blandit facilisis, dui erat consequat felis, eget molestie felis ex ac nulla.",
          style: TextStyle(
              fontFamily: 'SilkScreen',
              fontWeight: FontWeight.w700,
              color: Colors.black),
          textScaleFactor: 0.8,
          textAlign: TextAlign.justify),
    );

    final organizerCard = new Container(
        width: vw,
        margin:
            EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 20.0),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 5)),
        child: Column(
          children: <Widget>[
            Center(
                child: Image.network(
              "https://cdn.iconicto.com/recyclomedia/media/org_picture/2020/06/28/org_pic_2.png",
              height: 80,
            )),
            Center(
              child: Text(
                "Organizer",
                style: TextStyle(fontFamily: 'SilkScreen', color: Colors.black),
                textScaleFactor: 1,
              ),
            ),
            Text(
              "Starbucks",
              style: TextStyle(
                  fontFamily: 'SilkScreen',
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              textScaleFactor: 1.5,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Color(0xFFE93B55),
                  size: 30.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  "starbucks@gmail.com",
                  style: TextStyle(
                      fontFamily: 'SilkScreen',
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  textScaleFactor: 1,
                ),
              ],
            )
          ],
        ));

    return new Scaffold(
      body: SafeArea(
        child: Container(
            child: ListView(
          children: <Widget>[
            pagerHeader,
            eventOverview,
            eventDescription,
            organizerCard
          ],
        )),
      ),
    );
  }
}
