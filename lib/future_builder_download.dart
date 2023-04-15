import 'package:flutter/material.dart';

class FutureBuilderTest extends StatefulWidget {
  const FutureBuilderTest({super.key});

  @override
  State<FutureBuilderTest> createState() => _AsyncDownloadClassState();
}

class _AsyncDownloadClassState extends State<FutureBuilderTest> {
  late Future<String> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = Future.delayed(
      const Duration(seconds: 5),
      () => "Data loaded",
    );
    print("initstate");
  }

  void handleOnPressed() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder<String>(
              future: _future, // a previously-obtained Future<String> or null
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  children = <Widget>[
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Result: ${snapshot.data}'),
                        ),
                        ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Geri çık"))
                      ],
                    ),
                  ];
                } else if (snapshot.hasError) {
                  children = <Widget>[
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
