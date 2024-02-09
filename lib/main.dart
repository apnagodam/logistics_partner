
import 'package:flutter/material.dart';
import 'package:flutter_helper_utils/flutter_helper_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Domain/Rest/data/services/location/location_service.dart';
import 'Domain/Rest/data/services/orders/running_orders_service.dart';
import 'Presentaion/ui/authentication/login_page.dart';
import 'Presentaion/ui/home/home_page.dart';
import 'Presentaion/utils/shared_pref/shared_pref_provider.dart';
import 'Presentaion/utils/shared_pref/translation_preference.dart';
import 'Presentaion/utils/widgets/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  var delegate = await LocalizationDelegate.create(
      basePath: 'assets/',
      fallbackLocale: 'hi',
      preferences: TranslatePreferences(),
      supportedLocales: ['en_US', 'hi']);

  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ], child: LocalizedApp(delegate, MyApp())));
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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            iconTheme: IconThemeData(color: Colors.green.shade800),
            useMaterial3: true,
          ),
          home: Scaffold(body: ref.watch(locationServiceProvider).when(
              data: (location) =>
                  ref.read(runningOrdersServiceProvider).when(data: (data)=> ref.read(sharedPrefProvider).getToken().isEmpty || data.status=="3"
                      ? const LoginPage()
                      : const HomePage(), error: (e,s)=>Container(), loading: ()=>loader())
              ,
              error: (e, s) => Container(
                child: Text(e.toString() + s.toString()),
              ),
              loading: () => loader()),),
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
