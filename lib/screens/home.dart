import 'package:assignment/api/api.dart';
import 'package:assignment/notifiers/notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    DataNotifier dataNotifier = Provider.of(context, listen: false);
    getDetails(dataNotifier);
  }

  @override
  Widget build(BuildContext context) {
    DataNotifier dataNotifier = Provider.of(context);

    return Scaffold(
      body: SafeArea(
        child: (dataNotifier.loading == true)?
        Center(child: CircularProgressIndicator()):
        (dataNotifier.error == true)?
        Center(child: Text('There is some issues right now, please check after some time')):
        ListView.builder(
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: dataNotifier.postList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                            dataNotifier.postList[index].displayName.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[500],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    (dataNotifier.postList[index].meta == null) ? Container() :
                    Text(
                      dataNotifier.postList[index].meta,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        dataNotifier.postList[index].desc,
                    ),SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Spaces',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
