import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRedBoxVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isRedBoxVisible = !isRedBoxVisible;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 200,
            height: 200,
            color: isRedBoxVisible ? Colors.red : Colors.transparent,
            child: isRedBoxVisible
                ? Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: GestureDetector(
                        onTap: () {
                          // Do something when blue box is tapped
                        },
                        child: Center(
                          child: Text(
                            'Tap me!',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: IgnorePointer(
                      ignoring: true,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.blue,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  setState(() {
                                    isRedBoxVisible = true;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
