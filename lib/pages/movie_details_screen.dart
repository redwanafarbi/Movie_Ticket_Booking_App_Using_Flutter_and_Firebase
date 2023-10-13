// import 'package:flutter/material.dart';
//
// class MovieDetailsScreen extends StatelessWidget {
//   String movies;
//
//   MovieDetailsScreen({required this.movies});
//
//   List movieType = ["2D", "3D"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Material(
//         color: Colors.black,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2.2,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   image: DecorationImage(
//                     image: AssetImage("images/${movies}.jpeg"),
//                     fit: BoxFit.contain,
//                     opacity: 0.8,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 40, left: 10, right: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Icon(
//                               Icons.arrow_back,
//                               color: Colors.white,
//                               size: 28,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.favorite_border_outlined,
//                                     color: Colors.white, size: 25),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.share_outlined,
//                                     color: Colors.white, size: 25),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Text(
//                         movies,
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10),
//                           child: Text(
//                             "Catagory",
//                             style: TextStyle(
//                               //height: 25,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFFF7D300),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 25,
//                           child: ListView.builder(
//                               shrinkWrap: true,
//                               scrollDirection: Axis.horizontal,
//                               itemCount: 2,
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   child: Container(
//                                     margin: EdgeInsets.symmetric(horizontal: 8),
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 10),
//                                     decoration: BoxDecoration(
//                                       color: index == 1
//                                           ? Color(0xFFF7D300)
//                                           : Colors.white,
//                                       borderRadius: BorderRadius.circular(5),
//                                       border: index != 1
//                                           ? Border.all(color: Colors.white60)
//                                           : null,
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         movieType[index],
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Positioned(
//                     child: Text(
//                   "Booking Now",
//                   style: TextStyle(color: Colors.white),
//                 )),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // class MovieDetailsScreen extends StatefulWidget {
// //   const MovieDetailsScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
// // }
// //
// // class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }
