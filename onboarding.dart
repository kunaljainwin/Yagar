import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


void main() {
  runApp(const MyApp());
}

late num h, w;

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
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController = PageController();

  var images = [
    "https://www.shutterstock.com/image-vector/vector-icons-business-communication-lorem-ipsum-575399260",
    "https://www.shutterstock.com/image-vector/social-network-vector-concept-flat-design-203228734",
    "https://www.shutterstock.com/image-vector/social-network-vector-concept-flat-design-203228734"
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.55],
                  colors: [Colors.transparent, Colors.black])),
          child: PageView(
              pageSnapping: true,
              physics: const FixedExtentScrollPhysics(),
              controller: _pageController,
              children: [
                onboardingPage(
                  image: images[0],
                  title: "Monitor container contents",
                  subtitle:
                      "Easily monitor the contents of your containers without any hassle.",
                ),
                onboardingPage(
                  image: images[1],
                  title: "Easy portion control",
                  subtitle:
                      "We got you. You can accurately measure and regulate the amount of food you consume",
                ),
                onboardingPage(
                  image: images[2],
                  title: "Preserve foods for long",
                  subtitle:
                      "The container helps keep food fresh and edible over an extended period of time, reducing worries about spoilage.",
                ),
              ]),
        ),
        Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: h * 0.148),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: SlideEffect(
                  spacing: 0,
                  radius: 2.0,
                  dotWidth: 32.0,
                  dotHeight: 3.0,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1,
                  dotColor: Colors.white.withOpacity(0.2),
                  activeDotColor: Color.fromRGBO(199, 102, 25, 1),
                ),
              ),
            )),
        Align(alignment: Alignment.bottomCenter, child: _loginButton()),
      ],
    ));
  }
}

class onboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  const onboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(height: h * 0.62, child: Image.network(image)),
            SizedBox(
              height: h * 0.07375,
            ),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Brandon Text Bold',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Brandon Text Bold',
                  fontSize: 13,
                  color: Color.fromRGBO(147, 147, 147, 1)),
            ),
          ],
        ),
      ),
    );
  }
}

class _loginButton extends StatelessWidget {
  const _loginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: h * 0.07375),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromRGBO(102, 49, 7, 1),
                Color.fromRGBO(242, 124, 32, 0.95)
              ]),
        ),
        child: Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Get started"),
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.symmetric(horizontal: 128, vertical: 13),
                textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2)),
          ),
        ),
      ),
    );
  }
}
