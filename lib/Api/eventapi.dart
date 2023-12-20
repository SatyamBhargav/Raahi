import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventApi extends StatefulWidget {
  const EventApi({super.key, this.stateName});
  final stateName;

  @override
  State<EventApi> createState() => _EventApiState();
}

class _EventApiState extends State<EventApi> {
  List<Map<String, dynamic>> events = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFlightResults();
  }

  Future<void> fetchFlightResults() async {
    const apiKey =
        '1b49aa31d7c9e086949e09fddb98f657585448bbe62af3d3ce0ce2e18d204443';
    final query = '${widget.stateName}';
    // final query = 'nepal';

    final url =
        'https://serpapi.com/search.json?q=events+in+$query&api_key=$apiKey&google_domain=google.com&gl=us&hl=en';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        events = List<Map<String, dynamic>>.from(data['events_results']);
        isLoading = false;
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Widget dateStyling(String eventdate) {
    String startDate = eventdate;
    List a = startDate.split(" ");
    return Column(
      children: [
        SizedBox(height: 10),
        Text(
          a[1],
          style: TextStyle(fontSize: 20),
        ),
        Text(a[0])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: events.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(events[index]['title'] ?? ''),
                    subtitle: Text(events[index]['date']['when']),
                    leading: dateStyling(events[index]['date']['start_date']),
                    trailing: Image.network(events[index]['thumbnail']),
                  ),
                );
              },
            ),
    );
  }
}
