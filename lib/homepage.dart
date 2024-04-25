import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  String frequency = '';

  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      _processImage();
    }
  }

  Future<void> _processImage() async {
    final inputImage = InputImage.fromFilePath(_imageFile!.path);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String extractedText = recognizedText.text;

    RegExp regExp = RegExp(r"\b(?:\+?88)?(?:017|013|015|016|018)\d{8}\b");
    Iterable<Match> matches = regExp.allMatches(extractedText);

    List<String> extractedNumbers = [];
    for (Match match in matches) {
      extractedNumbers.add(match.group(0)!);
    }

    try {
      print(extractedNumbers[0]);

      setState(() {
        if (!extractedNumbers[0].contains('88')) {
          _textController.text = extractedNumbers[0];
        } else {
          _textController.text = extractedNumbers[0].substring(2);
        }
      });
    } catch (e) {
      _textController.text = "Error in auto number detection";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Frequency',
          style: GoogleFonts.bebasNeue(fontSize: 40),
        ),
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
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.bebasNeue(fontSize: 22),
              decoration: InputDecoration(
                hintText: 'Enter mobile number',
                filled: true,
                fillColor: Colors.orange[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintStyle: GoogleFonts.bebasNeue(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                    setState(() {
                      frequency = '';
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.camera_alt),
              label: Text(
                'Camera',
                style: GoogleFonts.bebasNeue(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[200],
              ),
            ),
            // SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.animation_outlined),
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
              label: Text(
                'Post',
                style: GoogleFonts.bebasNeue(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
