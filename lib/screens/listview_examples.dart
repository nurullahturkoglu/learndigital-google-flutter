import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/repository/food_repository.dart';

class ListViewEkle extends ConsumerStatefulWidget {
  const ListViewEkle({super.key});

  String get title => "ListViewEkle";

  @override
  ConsumerState<ListViewEkle> createState() => _ListViewEkleState();
}

class _ListViewEkleState extends ConsumerState<ListViewEkle> {
  @override
  Widget build(BuildContext context) {
    final foodList = ref.watch(foodProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Align(
        child: Column(
          children: [
            const PhysicalModel(
              elevation: 8.0,
              shape: BoxShape.rectangle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Yemek Listesi",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                itemCount: foodList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: PhysicalModel(
                      elevation: 6.0,
                      shape: BoxShape.rectangle,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: ListTile(
                        onTap: () {
                          print(foodList[index]);
                        },
                        contentPadding: const EdgeInsets.all(5),
                        textColor: Colors.black87,
                        title: Text(
                          foodList.elementAt(index),
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          "${foodList.elementAt(index)} en lezzetli şeydir!",
                        ),
                        // leading: const Icon(Icons.favorite_outline),
                        trailing: const Icon(Icons.favorite_outline),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
