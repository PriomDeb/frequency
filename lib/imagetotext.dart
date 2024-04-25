// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';

// class ImageToText extends StatefulWidget {
//   const ImageToText({Key? key}) : super(key: key);

//   @override
//   _ImageToTextState createState() => _ImageToTextState();
// }

// class _ImageToTextState extends State<ImageToText> {
//   XFile? pickedImage;
//   String mytext = '';
//   bool scanning = false;

//   final ImagePicker _imagePicker = ImagePicker();

//   getImage(ImageSource ourSource) async {
//     XFile? result = await _imagePicker.pickImage(source: ourSource);

//     if (result != null) {
//       setState(() {
//         pickedImage = result;
//       });

//       performTextRecognition();
//     }
//   }

//   performTextRecognition() async {
//     setState(() {
//       scanning = true;
//     });

//     try {
//       final inputImage = InputImage.fromFilePath(pickedImage!.path);
//       final textRecognizer = GoogleMlKit.vision.textRecognizer();
//       final recognizedText = await textRecognizer.processImage(inputImage);
//     } catch (e) {
//       print("Error while text recognition.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Text Recognition')),
//       body: ListView(
//         children: [
//           pickedImage == null 
//           ? Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Container(height: 400, child: Center(child: Text('No Image.')),)
          
//         ],
//       ),
//     );
//   }
// }
