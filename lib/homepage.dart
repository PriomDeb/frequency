// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final _textController = TextEditingController();

//   String frequency = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                   child: Container(
//                       // color: Colors.red,
//                       child: Center(
//                 child: Text(
//                   frequency,
//                   style: const TextStyle(fontSize: 40),
//                 ),
//               ))),
//               TextField(
//                 controller: _textController,
//                 decoration: InputDecoration(
//                     hintText: 'Enter mobile number',
//                     border: const OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           _textController.clear();
//                           setState(() {
//                             frequency = '';
//                           });
//                         },
//                         icon: const Icon(Icons.clear))),
//               ),
//               MaterialButton(
//                 onPressed: () {
//                   setState(() {
//                     frequency = _textController.text;

//                     String inputNumbers = _textController.text;

//                     List<String> characters = inputNumbers.split('');

//                     int sum = 0;

//                     characters.forEach((element) {
//                       int? number = int.tryParse(element);
//                       if (number != null) {
//                         sum += number;
//                       }
//                     });

//                     int lastSum = 0;

//                     sum.toString().split('').forEach((element) {
//                       int? number = int.tryParse(element);
//                       if (number != null) {
//                         lastSum += number;
//                       }
//                     });

//                     frequency = lastSum.toString();
//                   });
//                 },
//                 color: Colors.amber[800],
//                 child: const Text(
//                   'Post',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               )
//             ]),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final TextEditingController _textController = TextEditingController();

//   String frequency = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Frequency', style: GoogleFonts.poppins()),
//         backgroundColor: Colors.orange,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.orange[100],
//                 ),
//                 child: Center(
//                   child: Text(
//                     frequency,
//                     style: GoogleFonts.poppins(fontSize: 40),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _textController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter mobile number',
//                 filled: true,
//                 fillColor: Colors.orange[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     _textController.clear();
//                     setState(() {
//                       frequency = '';
//                     });
//                   },
//                   icon: Icon(Icons.clear),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   frequency = _textController.text;

//                   String inputNumbers = _textController.text;

//                   List<String> characters = inputNumbers.split('');

//                   int sum = 0;

//                   characters.forEach((element) {
//                     int? number = int.tryParse(element);
//                     if (number != null) {
//                       sum += number;
//                     }
//                   });

//                   int lastSum = 0;

//                   sum.toString().split('').forEach((element) {
//                     int? number = int.tryParse(element);
//                     if (number != null) {
//                       lastSum += number;
//                     }
//                   });

//                   frequency = lastSum.toString();
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orange,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 'Post',
//                 style: GoogleFonts.poppins(color: Colors.white),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'imagetotext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  String frequency = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequency', style: GoogleFonts.poppins()),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orange[100],
                ),
                child: Center(
                  child: Text(
                    frequency,
                    style: GoogleFonts.poppins(fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter mobile number',
                filled: true,
                fillColor: Colors.orange[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                    setState(() {
                      frequency = '';
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  frequency = _textController.text;

                  String inputNumbers = _textController.text;

                  int sum = 0;

                  for (int i = 0; i < inputNumbers.length; i++) {
                    int digit = int.tryParse(inputNumbers[i]) ?? 0;
                    sum += digit;
                  }

                  while (sum >= 10) {
                    int tempSum = 0;
                    while (sum > 0) {
                      tempSum += sum % 10;
                      sum ~/= 10;
                    }
                    sum = tempSum;
                  }

                  frequency = sum.toString();
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Post',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
