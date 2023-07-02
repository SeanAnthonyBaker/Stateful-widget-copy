import 'package:flutter/material.dart';
import 'base-client.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Your Learning Journeys'),
          centerTitle: true,
        ),
        body: Card(
          child: Column(
            children: _stories
                .map((e) => ListTile(
                      title: Text(e),
                      tileColor: Colors.grey[100],
                      onTap: () async {
                        print(e);
                        var response = await BaseClient()
                            .get('/UXTeam')
                            .catchError((err) {});
                        if (response == null) {
                          debugPrint('unsuccessful:');
                          return;
                        }
                        debugPrint(response.toString());
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

/*             
              ListTile(
                title: const Text('Develop a front end widget'),
                tileColor: Colors.grey[100],
                onTap: () {},
              ),
              ListTile(
                title: const Text('Create a ListTile view'),
                tileColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                title: const Text('Connect up with Cloud Fire Story'),
                tileColor: Colors.grey[100],
                onTap: () {},
              ),
              ListTile(
                title: const Text('Build Master Detail navigation'),
                tileColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                title: const Text('Connect up with Cloud FireStore'),
                tileColor: Colors.grey[100],
                onTap: () {},
              ),
              ListTile(
                title: const Text('Develop SteamPunk OData service'),
                tileColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                title: const Text('Create the ABAP communication System'),
                tileColor: Colors.grey[100],
                onTap: () {},
              ),
              ListTile(
                title: const Text('Develop HTTPS access widgets'),
                focusColor: Color(0xffecf9dd),
                tileColor: Colors.white,
                onTap: () {},
              ),
              ListTile(
                title: const Text('Connect up widget with SteamPunk backend'),
                focusColor: Color(0xffecf9dd),
                tileColor: Colors.grey[100],
                onTap: () {},
              )
   */
