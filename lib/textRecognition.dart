import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognitionfromImage extends StatefulWidget {
  const TextRecognitionfromImage({super.key});

  @override
  State<TextRecognitionfromImage> createState() =>
      _TextRecognitionfromImageState();
}

class _TextRecognitionfromImageState extends State<TextRecognitionfromImage> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

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
    print(extractedText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Recognition'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile == null
                ? const Text("Select an image to analyze")
                : Image.file(_imageFile!),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: _pickImage, child: const Text('Pick Image')),
          ],
        ),
      )),
    );
  }
}
