import 'package:flutter/material.dart';

void main() {
  runApp(const TestInherited());
}

class TestInherited extends StatelessWidget {
  const TestInherited({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ControlStatementWidget extends InheritedWidget {
  const ControlStatementWidget(
      {super.key,
      required super.child,
      required this.yemekler,
      required this.ekleYemek});

  final List<String> yemekler;
  final void Function(String yemek) ekleYemek;

  static ControlStatementWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ControlStatementWidget>();
  }

  static ControlStatementWidget of(BuildContext context) {
    final ControlStatementWidget? result = maybeOf(context);
    assert(result != null, 'No ControlStatementWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ControlStatementWidget oldWidget) {
    print("${this.yemekler} , ${oldWidget.yemekler}");
    return true;
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> yemekler = ["Nohut", "Pilav", "Tavuk", 'Izgara Kanat'];
  String test = "lorem ipsum " * 10;

  void ekleYemek(String yemek) {
    setState(() {
      yemekler.add(yemek);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                onPressed: onPressed, icon: const Icon(Icons.abc_rounded)),
            IconButton(
                onPressed: onPressed, icon: const Icon(Icons.access_time))
          ],
        ),
        body: ControlStatementWidget(
          yemekler: yemekler,
          ekleYemek: ekleYemek,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: const [
                Yemekler(),
                YemekListesi(),
                YemekEkle(),
              ],
            ),
          ),
        ));
  }

  void onPressed() {}
}

class YemekEkle extends StatefulWidget {
  const YemekEkle({
    super.key,
  });

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
    final state = ControlStatementWidget.of(context);
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
                    state.ekleYemek(value);
                    _controller.text = "";
                  },
            child: const Text("Ekle")),
      ],
    );
  }
}

class YemekListesi extends StatelessWidget {
  const YemekListesi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var state = ControlStatementWidget.of(context);

    return Column(
      children: [
        for (final yemek in state.yemekler) Text(yemek),
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
    return Text(
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
