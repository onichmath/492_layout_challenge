import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> forecast = {
    "name": "today",
    "temperature": "35",
    "shortForecast": "Snowy",
    "detailedForecast": "Snowy all day",
    "windSpeed": "10",
    "windDirection": "SE",
    "isDaytime": "true",
    "probabilityOfPercipitation": "100"
  };

  Map<String, String> location = {
    "city": "Bend",
    "state": "Oregon",
    "zip": "97702"
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      topRow(screenHeight, screenWidth),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: BoxPlaceholder(
                height: screenHeight / 5,
                width: screenWidth,
                text: "Temperature: ${forecast["temperature"]}F",
                color: Colors.blue)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: BoxPlaceholder(
              height: screenHeight / 5,
              width: screenWidth,
              text:
                  "Wind going ${forecast["windSpeed"]}mph ${forecast["windDirection"]}",
              color: Colors.red),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: BoxPlaceholder(
                height: screenHeight / 5,
                width: screenWidth,
                text: forecast["detailedForecast"],
                color: Colors.deepPurple)),
      ),
    ]));
  }

  Row topRow(screenHeight, screenWidth) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: BoxPlaceholder(
                height: screenHeight / 10,
                width: screenWidth / 5,
                text: location["city"]!,
                color: Colors.red)),
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BoxPlaceholder(
                height: screenHeight / 10,
                width: screenWidth / 5,
                text: location["state"]!,
                color: Colors.red),
          )),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: BoxPlaceholder(
                  height: screenHeight / 10,
                  width: screenWidth / 5,
                  text: location["zip"],
                  color: Colors.red))),
    ]);
  }
}

class ForecastText extends StatelessWidget {
  const ForecastText({
    super.key,
    required this.forecast,
  });

  final Map<String, String> forecast;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: forecast.length,
        itemBuilder: (BuildContext context, int index) {
          String key = forecast.keys.elementAt(index);
          String? value = forecast[key];
          return ListTile(
            title: Text(key),
            subtitle: Text(value!),
          );
        });
  }
}

class BoxPlaceholder extends StatelessWidget {
  final double height;
  final double width;
  final String? text;
  final Color color;

  const BoxPlaceholder({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Placeholder(color: color, child: Center(child: Text(text!))));
  }
}
