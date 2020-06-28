import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  final String eventName;
  final String eventBanner;
  final String eventOrg;
  final String eventDate;
  final String eventTime;
  final String eventDes;
  final String eventOrgBanner;
  final String eventOrgEmail;

  const EventDetails({
    this.eventName,
    this.eventBanner,
    this.eventOrg,
    this.eventDate,
    this.eventTime,
    this.eventDes,
    this.eventOrgBanner,
    this.eventOrgEmail,
  });

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
          image: NetworkImage('${widget.eventBanner}'),
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
            '${widget.eventName}',
            style: TextStyle(
                fontFamily: 'SilkScreen',
                fontWeight: FontWeight.w700,
                color: Colors.black),
            textScaleFactor: 2,
          ),
          Text(
            "by " + '${widget.eventOrg}',
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
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("lib/assets/images/calendar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${widget.eventDate}',
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
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/images/clock.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${widget.eventTime}',
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
      child: Text('${widget.eventDes}',
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
            EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 5)),
        child: Column(
          children: <Widget>[
            Center(
                child: Image.network(
              '${widget.eventOrgBanner}',
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
              '${widget.eventOrg}',
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
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/images/email.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '${widget.eventOrgEmail}',
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
