import 'package:flutter/material.dart';
import 'package:grpc_flutter_golang/example.dart';
import 'package:grpc/grpc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter gRPC Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter gRPC Client'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _responseText = '';

  Future<void> _callGrpcService() async {
    final channel = ClientChannel(
      'localhost',
      port: 8080,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    final client = StringServiceClient(channel);

    try {
      final response = await client.processStrings(
        StringArray(values: ['Hello', 'World']),
      );

      setState(() {
        _responseText = 'Response from server: ${response.value}';
      });
    } catch (e) {
      print('Caught error: $e');
    }

    await channel.shutdown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_responseText',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _callGrpcService,
        tooltip: 'Call gRPC Service',
        child: Icon(Icons.send),
      ),
    );
  }
}
