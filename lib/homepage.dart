import 'package:flutter/material.dart';
import 'package:realtimelocation/channel.dart';

void main() => runApp(const HomePageApp());

class HomePageApp extends StatelessWidget {
  const HomePageApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin HomePage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RealTimeLocation'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Real Time Lat and Long!"),
              StreamBuilder(
                  stream: LocationChannel.getLocationStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(children: const [
                        Center(child: CircularProgressIndicator()),
                        Spacer(),
                      ]);
                    } else if (snapshot.connectionState ==
                            ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text(
                            'Something went Wrong to fetching the location!');
                      } else if (snapshot.hasData) {
                        return Text(snapshot.data.toString());
                      } else {
                        return const Center(
                            child: Text('No location found! waiting'));
                      }
                    } else {
                      return Center(
                          child: Text('State: ${snapshot.connectionState}'));
                    }
                  })
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Run HomePage',
          child: const Icon(Icons.play_arrow),
        ));
  }
}
