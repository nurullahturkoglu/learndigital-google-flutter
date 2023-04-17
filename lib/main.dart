import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/auth/register.dart';
import 'package:myapp/repository/food_repository.dart';
import 'package:myapp/screens/await_download.dart';
import 'package:myapp/screens/flutter_inputs.dart';
import 'package:myapp/screens/images_example.dart';
import 'package:myapp/screens/listview_examples.dart';
import 'package:myapp/screens/login_ui.dart';
import 'package:myapp/screens/test_inherited_widget.dart';
import 'firebase/firebase_options.dart';
import 'firebase/firebase_test.dart';

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
      home: const LoginUi(),
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
                  child: const Text("Firebase test.."),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const FirebaseTest();
                      },
                    ));
                  },
                ),
                ElevatedButton(
                  child: const Text("Riverpod User Test..."),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return AsyncDownloadClass();
                      },
                    ));
                  },
                ),
                ElevatedButton(
                  child: const Text("Kayit ol..."),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const RegisterPage();
                      },
                    ));
                  },
                ),
                ImagesExampleClass(
                  imgUrl: 'images/chloe.jpg',
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
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.pink),
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
              ],
            ),
          ),
        ));
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
