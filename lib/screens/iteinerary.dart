import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:raahi/Api/openai.dart';
import 'package:raahi/screens/finaliteinerary.dart';
import 'package:raahi/screens/loadingscreen.dart';

class Iteinerary extends StatefulWidget {
  const Iteinerary({super.key, required this.destinationName});
  final String destinationName;

  @override
  State<Iteinerary> createState() => _IteineraryState();
}

class _IteineraryState extends State<Iteinerary> {
  DateTimeRange selectedDates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  String formatDate(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  String initialBudget = '1000-2500';
  List<String> budget = [
    '1000-2500',
    '2500-5000',
    '5000-7500',
    '7500-10000',
    '10000-15000',
    '15000-20000'
  ];

  String _answerText = '';
  bool _isLoading = false;

  void handleButtonPress() {
    setState(() {
      _isLoading = true;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoadingScreen();
    }));
    Future.delayed(Duration(seconds: 24), () {
      setState(() {
        _isLoading = false;
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate = selectedDates.start;
    DateTime endDate = selectedDates.end;
    String defaultstartDate = formatDate(startDate, "EEE, dd MMM");
    String defaultendDate = formatDate(endDate, "EEE, dd MMM");

    sendRequest(String destination) async {
      setState(() {
        _isLoading = true;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoadingScreen();
      }));
      final result = await OpneAi.postRequest(
          msg:
              'i want to travel from delhi to $destination from $startDate to $endDate and i have a budget of $initialBudget in inr create an itinerary please display my destination, dates and budget in the result');
      if (result != null) {
        setState(() {
          _isLoading = false;
          _answerText = result;
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return FinalIteinerary(responseText: _answerText);
            },
          ));
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            alignment: Alignment.topCenter,
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff96e072),
                border: Border.all(),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 10),
                      child: Row(children: [
                        const Icon(Iconsax.location),
                        const SizedBox(width: 5),
                        Text(
                          widget.destinationName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ]),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final DateTimeRange? dateTimeRange =
                            await showDateRangePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000));
                        if (dateTimeRange != null) {
                          setState(() {
                            selectedDates = dateTimeRange;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, right: 15, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Iconsax.calendar_1,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "$defaultstartDate - ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Icon(Iconsax.calendar_1),
                            const SizedBox(width: 5),
                            Text(
                              defaultendDate,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            // Text("${selectedDates.duration.inDays}")
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        children: [
                          Icon(Iconsax.empty_wallet),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 140,
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: initialBudget,
                              items: budget.map((String budgetValue) {
                                return DropdownMenuItem<String>(
                                    value: budgetValue,
                                    child: Text(
                                      budgetValue,
                                      style: TextStyle(fontSize: 16),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  initialBudget = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                TextButton(
                    onPressed: () {
                      // handleButtonPress();
                      sendRequest(widget.destinationName);
                      // completionFun(widget.destinationName, initialBudget);
                    },
                    child: Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ));
  }
}
