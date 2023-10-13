import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_tickets_booking_app/utils/date.dart';
import 'package:movie_tickets_booking_app/utils/date_time_extension.dart';
import 'package:movie_tickets_booking_app/utils/time.dart';
import '../utils/seat_pattern.dart';

class SeatBookingScreen extends StatefulWidget {
  String movies;

  SeatBookingScreen({required this.movies});

  @override
  State<SeatBookingScreen> createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  final selectedSeat = ValueNotifier<List<String>>([]);
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final selectedTime = ValueNotifier<TimeOfDay?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            //FontAwesomeIcons.arrowLeft,
             Icons.arrow_back_ios_new_rounded,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Select Seat",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: selectedSeat,
            builder: (BuildContext context, List<String> value, Widget? child) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      color: Colors.yellow.shade900,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      child: Text(
                        "Screen",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    for (int i = 1; i <= 5; i++) ...[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int j = 1; j <= 8; j++) ...[
                            SeatWidget(
                              seatNumber: "${String.fromCharCode(i + 64)}$j",
                              width: (MediaQuery.of(context).size.width - 48 - 66) / 8,
                              height: (MediaQuery.of(context).size.width - 48 - 66) / 8,
                              isAvailable: i != 5,
                              isSelected: value.contains(
                                "${String.fromCharCode(i + 64)}$j",
                              ),
                              onTap: () {
                                if (value.contains(
                                  "${String.fromCharCode(i + 64)}$j",
                                )) {
                                  selectedSeat.value = List.from(value)
                                    ..remove(
                                      "${String.fromCharCode(i + 64)}$j",
                                    );
                                } else {
                                  selectedSeat.value = List.from(value)
                                    ..add(
                                      "${String.fromCharCode(i + 64)}$j",
                                    );
                                }
                              },
                            ),
                            // make gap, and in the center wider gap
                            if (i != 8) SizedBox(width: j == 4 ? 16 : 4)
                          ]
                        ],
                      ),
                      if (i != 6) const SizedBox(height: 6)
                    ],
                    const SizedBox(height: 5),
                    const Expanded(child: SizedBox()),
                    const SeatInfoWidget(),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(48),
                ),
                color: Colors.yellow.shade200,
              ),
              padding: const EdgeInsets.fromLTRB(24,24,24,10),
              //padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Date",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  ValueListenableBuilder<DateTime>(
                      valueListenable: selectedDate,
                      builder: (context, value, _){
                        return SizedBox(
                          height: 96,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                    14,
                                    (index) {
                                      final date = DateTime.now().add(Duration(days: index));
                                      return InkWell(
                                        onTap: (){
                                          selectedDate.value = date;
                                        },
                                        child: DateWidget(
                                          date: date,
                                          isSelected: value.simpleDate == date.simpleDate,
                                        ),
                                      );
                                    }),
                          ),
                        );
                      }),
                  SizedBox(height: 3),
                  ValueListenableBuilder(
                      valueListenable: selectedTime,
                      builder: (context,value,_) {
                        return SizedBox(
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(8,
                                    (index){
                                  final time = TimeOfDay(
                                  hour: 10 + (index * 2),
                                  minute: 0,
                                  );
                                  return InkWell(
                                    onTap: (){
                                      selectedTime.value = time;
                                    },
                                    child: TimeWidget(
                                      time: time,
                                      isSelected: value == time,
                                    ),
                                  );
                                    }),
                          ),
                        );
                  }),

                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Prize",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(height: 15),
                              ValueListenableBuilder<List<String>>(
                                valueListenable: selectedSeat,
                                builder: (context, value, _) {
                                  return Text(
                                    "\$${value.length * 100}",
                                    style:
                                    Theme.of(context).textTheme.headlineSmall,
                                  );
                                },
                              ),
                            ],
                          ),
                      ),
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade600,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
