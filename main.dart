import 'package:flutter/material.dart';
import 'package:get_api/model.dart';
import 'package:get_api/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonParseDemo(),
    );
  }
}

class JsonParseDemo extends StatefulWidget {
  //
  JsonParseDemo() : super();
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  //
  List<User> _users;
  bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: _users == null ? 0 : _users.length,
          itemBuilder: (context, index) {
            User user = _users[index];
            return ListTile(
              title: Text(user.clientInfos[index].cLINTNAME),
              subtitle: Text(user.clientInfos[index].cLINTEMAIL),
            );
          },
        ),
      ),
    );
  }
}
