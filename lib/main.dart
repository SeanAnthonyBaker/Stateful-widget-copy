import 'package:flutter/material.dart';
import 'base-client.dart';
// import 'dart:convert' as convert;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(), //
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _stories = [
    'Develop a front end widget',
    'Create a ListTile view',
    'Connect up with Cloud Firestore',
    'Build Master Detail navigation',
    'Connect up with Cloud Firestore',
    'Develop SteamPunk OData service',
    'Build Master Detail navigation',
    'Create the ABAP communication System',
    'Develop HTTPS access widgets',
    'Connect up widget with SteamPunk backend'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Learning Journeys'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              // Handle button press
              var jsonresponse =
                  await BaseClient().get("/UXTeam").catchError((err) {});

              if (jsonresponse == null) {
                debugPrint('Unsuccessful');
                return;
              }

              //               final Map parsed = response.decode();
              // Process the response data
              // Example: Print the first entity in the response

              var entities = jsonresponse['value'];

              if (entities != null && entities.isNotEmpty) {
                final firstEntity = entities[0];
                print(firstEntity);
              }
              print('hi');
              print('there');
            },
          ),
        ],
      ),
      body: Card(
        child: ListView.builder(
          itemCount: _stories.length,
          itemBuilder: (BuildContext context, int index) {
            String story = _stories[index];
            return ListTile(
              title: Text(story),
              tileColor: Colors.grey[100],
            );
          },
        ),
      ),
    );
  }
}
