import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTest extends StatefulWidget {
  const InputTest({super.key, required this.foodList});
  final List<String> foodList;
  @override
  State<InputTest> createState() => _InputTestState();
}

enum Servis { self, online }

class _InputTestState extends State<InputTest> {
  bool checkBox1value = false;
  Servis? service;
  late String dropdownvalue;
  String? kullaniciNotu;
  double aciMiktari = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownvalue = widget.foodList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter input"),
          actions: <Widget>[
            IconButton(onPressed: () => {}, icon: const Icon(Icons.settings)),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Checkbox(
                  onChanged: (bool? value) {
                    setState(() {
                      checkBox1value = !checkBox1value;
                    });
                  },
                  value: checkBox1value,
                ),
                Text("+5TL Tatli : $checkBox1value"),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text('Self Servis'),
                  leading: Radio<Servis>(
                    value: Servis.self,
                    groupValue: service,
                    onChanged: (Servis? value) {
                      setState(() {
                        service = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text("Online Servis"),
                  leading: Radio<Servis>(
                    value: Servis.online,
                    groupValue: service,
                    onChanged: (Servis? value) {
                      setState(() {
                        service = value;
                      });
                    },
                  ),
                ),
                Text("Seçim ${service ?? ''}"),
                const SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: widget.foodList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
                Text('Seciminiz: $dropdownvalue'),
                const SizedBox(
                  height: 20,
                ),
                CupertinoSlider(
                  min: 0.0,
                  max: 30.0,
                  value: aciMiktari,
                  onChanged: (value) {
                    setState(() {
                      aciMiktari = value;
                    });
                  },
                ),
                Text("Aci miktari: ${aciMiktari.floor()}"),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'Notunuzu buraya giriniz.',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  onChanged: (value) {
                    setState(() {
                      kullaniciNotu = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Girdiginiz not: ${kullaniciNotu ?? 'bos'}"),
              ],
            ),
          ),
        ));
  }
}
