import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/screens/register_ui.dart';
import 'package:myapp/widgets/register.dart';
import 'package:myapp/repository/food_repository.dart';
import 'package:myapp/screens/flutter_inputs.dart';
import 'package:myapp/screens/images_example.dart';
import 'package:myapp/screens/listview_examples.dart';
import 'package:myapp/screens/login_ui.dart';
import 'package:myapp/screens/test_inherited_widget.dart';
import 'package:rive/rive.dart';
import 'firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Test"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  void ekleYemek(String yemek) {
    ref.read(foodProvider).add(yemek);
  }

  String test = "lorem ipsum " * 10;

  @override
  Widget build(BuildContext context) {
    print("rerender");
    final foods = ref.watch(foodProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.abc_rounded)),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.access_time))
          ],
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Column(
                  children: [
                    const Yemekler(),
                    YemekListesi(foods),
                    YemekEkle(ekleYemek),
                  ],
                ),
                ElevatedButton(
                  child: const Text("Kayit ol..."),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 200,
                  width: 200,
                  child: RiveAnimation.asset(
                    'assets/animations/4224-8759-greedy-imp.riv',
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                  child: const Text('Yemekleri listele..'),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const ListViewEkle();
                      },
                    ));
                  },
                ),
                const AnimationWidget(),
              ],
            ),
          ),
        ));
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin<AnimationWidget> {
  @override
  late Ticker _ticker;

  double _dikeyKonum = 0.0;
  void initState() {
    // TODO: implement initState
    Ticker _ticker = createTicker((Duration elapsed) {
      final aci = pi *
          elapsed.inMicroseconds /
          const Duration(seconds: 1).inMicroseconds;
      setState(() {
        _dikeyKonum = cos(aci) * 30 + 30;
      });
    });
    _ticker.start();
    super.initState();
  }

  @override
  void dispose() {
    _ticker.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_dikeyKonum),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink),
        ),
        child: const Text('Sipariş ver...'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return InputTest(
                foodList: foods,
              );
            },
          ));
        },
      ),
    );
  }
}

class YemekEkle extends StatefulWidget {
  const YemekEkle(
    this.ekleYemek, {
    super.key,
  });

  final Function ekleYemek;
  @override
  State<YemekEkle> createState() => _YemekEkleState();
}

class _YemekEkleState extends State<YemekEkle> {
  late TextEditingController _controller;
  String value = '';

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: prefer_const_constructors
        TextField(
          controller: _controller,

          onChanged: (text) {
            value = text;
            setState(() {});
          },
          // obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Yeni yemek giriniz.',
          ),
        ),
        Text("Girdiginiz deger: ${_controller.text}"),
        ElevatedButton(
            onPressed: value == ''
                ? null
                : () {
                    widget.ekleYemek(value);
                    _controller.text = "";
                  },
            child: Text("Ekle")),
      ],
    );
  }
}

class YemekListesi extends StatelessWidget {
  const YemekListesi(
    this.yemekListesi, {
    super.key,
  });

  final List<String> yemekListesi;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final yemek in yemekListesi) Text(yemek),
      ],
    );
  }
}
