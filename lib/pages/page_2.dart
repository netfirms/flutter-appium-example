import 'package:flutter/material.dart';

/**
 * User: taweechaimaklay
 * Date: 2/11/2019 AD
 * Time: 17:33
 */
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            key: Key('backBtn'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Page2',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          child: Center(
            child: Text('Page2', key: Key('page2GreetingLbl')),
          ),
        ));
    ;
  }
}
