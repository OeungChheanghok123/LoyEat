// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// class TestWidget extends StatefulWidget {
//   const TestWidget({Key? key}) : super(key: key);
//
//   @override
//   _TestWidgetState createState() => _TestWidgetState();
// }
//
// class _TestWidgetState extends State<TestWidget> {
//
//   final DateRangePickerController _controller = DateRangePickerController();
//   bool isClick = false;
//   String text = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Container(
//         margin: const EdgeInsets.all(15.0),
//         child: Stack(
//           children: <Widget>[
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   isClick = !isClick;
//                 });
//               },
//               child: const Text("click"),
//             ),
//             isClick ? Card(
//               margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//               elevation: 5,
//               child: SfDateRangePicker(
//                 controller: _controller,
//                 view: DateRangePickerView.month,
//                 selectionMode: DateRangePickerSelectionMode.range,
//                 initialDisplayDate: DateTime.now(),
//                 showTodayButton: true,
//                 showActionButtons: true,
//                 enablePastDates: true,
//                 onSelectionChanged: selectionChanged,
//                 monthViewSettings: const DateRangePickerMonthViewSettings(
//                   enableSwipeSelection: true,
//                   showTrailingAndLeadingDates: true,
//                 ),
//                 onSubmit: (obj) {
//                   setState(() {
//                     obj = text;
//                   });
//                 },
//                 onCancel: (){
//                   _controller.selectedRange = null;
//                   setState(() {
//                     isClick = false;
//                   });
//                 },
//               ),
//             ) : Container(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void selectionChanged(DateRangePickerSelectionChangedArgs args) {
//     int firstDayOfWeek = DateTime.sunday % 7;
//     int endDayOfWeek = (firstDayOfWeek - 1) % 7;
//     endDayOfWeek = endDayOfWeek <  0? 7 + endDayOfWeek : endDayOfWeek;
//     PickerDateRange ranges = args.value;
//     DateTime? date1 = ranges.startDate;
//     DateTime? date2 = ranges.endDate?? ranges.startDate;
//     if(date1!.isAfter(date2!))
//     {
//       var date=date1;
//       date1=date2;
//       date2=date;
//     }
//     int day1 = date1.weekday % 7;
//     int day2 = date2.weekday % 7;
//
//     DateTime dat1 = date1.add(Duration(days: (firstDayOfWeek - day1)));
//     DateTime dat2 = date2.add(Duration(days: (endDayOfWeek - day2)));
//
//     _controller.selectedRange = PickerDateRange(dat1, dat2);
//   }
//
//   bool isSameDate(DateTime date1, DateTime date2) {
//     if (date2 == date1) {
//       return true;
//     }
//     // ignore: unnecessary_null_comparison
//     if (date1 == null || date2 == null) {
//       return false;
//     }
//     return date1.month == date2.month &&
//         date1.year == date2.year &&
//         date1.day == date2.day;
//   }
// }
