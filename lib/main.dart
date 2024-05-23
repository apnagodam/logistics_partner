import 'package:ag_logistics_partner/Presentaion/ui/home/WSP/wsp_home_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/driver/driver_home_screen.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/home/transporter_home_page.dart';
import 'package:ag_logistics_partner/Presentaion/ui/home/transporter/transporter_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Domain/Rest/data/services/location/location_service.dart';
import 'Presentaion/utils/shared_pref/shared_pref_provider.dart';
import 'Presentaion/utils/shared_pref/translation_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var pref = await SharedPref.load();
  var delegate = await LocalizationDelegate.create(
      basePath: 'assets/',
      fallbackLocale: 'hi',
      preferences: TranslatePreferences(),
      supportedLocales: ['en_US', 'hi']);

  runApp(ProviderScope(
      child: LocalizedApp(delegate, ResponsiveSizer(
    builder: (context, orientation, screenType) {
      return MyApp();
    },
  ))));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(locationServiceProvider.notifier).getLocation();
    return LocalizationProvider(
        state: LocalizationProvider.of(context).state,
        child: MaterialApp(
          title: '',
          theme: ThemeData(
              cardColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: GoogleFonts.kanit().fontFamily,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.green,
                  primary: Colors.green.shade900,
                  secondary: Colors.yellow),
              useMaterial3: false),
          home: Scaffold(body: TransporterHomeScreen()
              // ref.watch(locationServiceProvider).when(
              //     data: (location) => ref.read(runningOrdersServiceProvider).when(
              //         data: (data) =>,
                          // SharedPref().getToken().isEmpty || data.status == "3"
                          //     ? const LoginPage()
                          //     : const HomePage(),
              //         error: (e, s) => Container(),
              //         loading: () => loader()),
              //     error: (e, s) => Container(
              //           child: Text(e.toString() + s.toString()),
              //         ),
              //     loading: () => loader()),
              ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes autyo-formatting nicer for build methods.
    );
  }
}
