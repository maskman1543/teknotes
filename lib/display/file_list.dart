import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileListScreen extends StatefulWidget {
  @override
  _FileListScreenState createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  List<String> fileList =
      []; // List to store file names (you can replace this with your file data structure)

  @override
  void initState() {
    super.initState();
    // Fetch and populate the fileList from Firebase Storage or Firestore here
    // Example: fetchFileListFromFirebase();
  }

  // Example method to fetch the file list from Firebase Storage
  // Replace this with your Firebase integration logic
  // void fetchFileListFromFirebase() {
  //   // Implement Firebase logic to fetch the file list
  //   // Update the 'fileList' state with the retrieved file names
  // }

  Future<void> _pickFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'xls',
          'xlsx',
          'ppt',
          'pptx'
        ], // Specify the allowed file types
      );

      if (result != null) {
        final filePaths = result.paths;
        if (filePaths != null) {
          // Upload the selected files to Firebase Storage or Firestore
          // Example: uploadFilesToFirebase(filePaths);
        }
      }
    } catch (e) {
      // Handle any errors that occur during file picking or uploading
      print('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File List'),
      ),
      body: fileList.isEmpty
          ? Center(
              child: Text('No files available.'),
            )
          : ListView.builder(
              itemCount: fileList.length,
              itemBuilder: (context, index) {
                final fileName = fileList[index];
                return ListTile(
                  title: Text(fileName),
                  // Add other file details here if needed
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a file picker dialog for file selection
          _pickFiles();
        },
        child: Icon(Icons.upload),
      ),
    );
  }

  // Example method to upload selected files to Firebase
  // Replace this with your Firebase file upload logic
  // void uploadFilesToFirebase(List<String> filePaths) {
  //   // Implement Firebase logic to upload files
  //   // Update the 'fileList' state with the uploaded file names
  // }
}
