import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/flutter_inputs.dart';
import 'package:myapp/listview_examples.dart';
import 'package:myapp/auth/register.dart';
import 'package:myapp/models/UserModel.dart';
import 'package:myapp/repository/food_repository.dart';
import 'package:myapp/repository/user_repository.dart';
import 'await_download.dart';
import 'images_example.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// // final helloWorldProvider = Provider((_) => 'Hello world from main');
// final counter = StateProvider<String>((ref) => '1');

// notifier provider example

// // future provider ex. (family -> /users/$value )
// final fetchUserProvider =
//     FutureProvider.family.autoDispose((ref, String value) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUser(value);
// });

// stream provider example

// final someStreamProvider = StreamProvider((ref) async* {
//   var allMessages = const <int>[];
//   for (var i = 0; i < 10; i++) {
//     await Future.delayed(Duration(seconds: 2));
//     allMessages = [...allMessages, i];
//     yield allMessages;
//   }
// });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

class Yemekler extends StatelessWidget {
  const Yemekler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Yemekler",
      textScaleFactor: 2,
    );
  }
}

class Yazi extends StatelessWidget {
  final String _benimYazim;
  Yazi(this._benimYazim, {super.key}) {
    print("statless");
  }

  @override
  Widget build(BuildContext context) {
    return Text("$_benimYazim");
  }
}

class statefulYazi extends StatefulWidget {
  final String _yazi;
  final int _value;

  statefulYazi(this._yazi, this._value, {super.key}) {
    print("stateful const");
  }

  @override
  State<statefulYazi> createState() => _statefulYaziState();
}

class _statefulYaziState extends State<statefulYazi> {
  _statefulYaziState() {
    print("sayi arttir state class const. oluştu");
  }
  @override
  int _newCount = 0;

  @override
  void initState() {
    super.initState();
    _newCount = widget._value;
  }

  void sayiArttir() {
    print("sayi arttir cagirildi");
  }

  Widget build(BuildContext context) {
    print('render');
    return ElevatedButton(
        onPressed: () {
          setState(() {
            _newCount++;
          });
        },
        child: Text("${widget._yazi} $_newCount"));
  }
}
