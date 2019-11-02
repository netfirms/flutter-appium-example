import 'package:flutter/material.dart';
import 'package:onboarding/pages/page_1.dart';
import 'package:onboarding/pages/page_2.dart';

/**
 * User: taweechaimaklay
 * Date: 2/11/2019 AD
 * Time: 17:09
 */
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final page1Button = Material(
      elevation: 5.0,
      color: Color(0xff01A0C7),
      child: MaterialButton(
        key: Key('page1Btn'),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page1()));
        },
        child: Text("Page1",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final page2Button = Material(
      elevation: 5.0,
      color: Color(0xff01A0C7),
      child: MaterialButton(
        key: Key('page2Btn'),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page2()));
        },
        child: Text("Page2",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            key: Key('logoutBtn'),
            icon: Icon(Icons.account_balance),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('Home'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Welcome to Home Page',
                    key: Key('homeGreetingLbl'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: page1Button,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: page2Button,
                )
              ],
            ),
          ),
        ));
  }
}
