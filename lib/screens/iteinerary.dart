import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:raahi/screens/finaliteinerary.dart';

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

  @override
  Widget build(BuildContext context) {
    DateTime startDate = selectedDates.start;
    DateTime endDate = selectedDates.end;
    String DefaultstartDate = formatDate(startDate, "EEE, dd MMM");
    String DefaultendDate = formatDate(endDate, "EEE, dd MMM");
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
                              "$DefaultstartDate - ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const Icon(Iconsax.calendar_1),
                            const SizedBox(width: 5),
                            Text(
                              DefaultendDate,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FinalIteinerary(
                            destinationName: widget.destinationName,
                            startDate: startDate.toString(),
                            endDate: endDate.toString(),
                            budget: initialBudget);
                      }));
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
