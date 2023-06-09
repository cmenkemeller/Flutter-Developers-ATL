import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_developers_atl/constants.dart';
import 'package:flutter_developers_atl/domain/errors/failure.dart';
import 'package:flutter_developers_atl/domain/models/meetup_event.dart';
import 'package:flutter_developers_atl/domain/services/meetup_service.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetupCard extends StatefulWidget {
  MeetupCard({Key? key}) : super(key: key);

  @override
  State<MeetupCard> createState() => _MeetupCardState();
}

class _MeetupCardState extends State<MeetupCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: FutureBuilder<dartz.Either<Failure, MeetupEvent>>(
          future: MeetupService().nextEvent(),
          builder: (context, snap) {
            if (snap.hasData) {
              var data = snap.data!.fold((l) => l, (r) => r);
              if (data is MeetupEvent) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.dateTime,
                          style: TextStyle(
                              color: primaryLightColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${data.attending} attendees',
                          style: TextStyle(color: greyColor),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            data.title,
                            style: TextStyle(
                                color: darkColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: greyColor,
                        ),
                        Text(
                          data.location,
                          style: TextStyle(color: greyColor),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [Expanded(child: Text(data.description))],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              launchUrl(Uri.parse(data.link));
                            },
                            child: Text('View on MeetUp')),
                      ],
                    )
                  ]),
                );
              } else {
                return Center(
                  child: Icon(Icons.error),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
