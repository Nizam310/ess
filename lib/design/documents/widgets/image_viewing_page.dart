import 'dart:io';

import 'package:employee_self_service_flutter/design/documents/documents_provider.dart';
import 'package:flutter/Material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ImageViewingPage extends StatefulWidget {
   File? file;
  final String title;
  final DocModel model;
  final BuildContext ctx;
  final bool isFront;
   ImageViewingPage({
    Key? key,
    this.file,
    required this.title,

    required this.ctx,
    required this.isFront, required this.model,
  }) : super(key: key);

  @override
  State<ImageViewingPage> createState() => _ImageViewingPageState();
}

class _ImageViewingPageState extends State<ImageViewingPage> {
  @override
  void didUpdateWidget(covariant ImageViewingPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.file != oldWidget.file) {
      setState(() {}); // Trigger a rebuild when the file changes
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(100);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0.8,
        backgroundColor: colorScheme.background,
        title: Text(
          widget.title,
          style: context.textTheme.titleLarge?.copyWith(color: colorScheme.onPrimary),
        ),
        actionsIconTheme: IconThemeData(color: colorScheme.onPrimary),
        actions: [
          InkWell(
            radius: 0.0,
            borderRadius: radius,
            onTap: () async {
              if (widget.file != null) {
                await _downloadFile(widget.file!);
              }
            },
            child: const Icon(Icons.download),
          ).paddingRight(10),
          InkWell(
            radius: 0.0,
            borderRadius: radius,
            onTap: () {
             widget.ctx.read<DocumentsVm>().pickFile(widget.model, isFront: widget.isFront);
            },
            child: const Icon(Icons.edit),
          ),
          InkWell(
            radius: 0.0,
            borderRadius: radius,
            onTap: () {},
            child: const Icon(Icons.share).paddingRight(10),
          ),
        ],
      ),
      body: Center(
        child: widget.file!=null?Image.file(
          widget.file!,
          fit: BoxFit.cover,
        ):const Text('No Image!'),
      ).paddingSymmetric(horizontal: 0),
    );
  }

  Future<void> _downloadFile(File file) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = file.path.split('/').last;
      final downloadPath = '${tempDir.path}/$fileName';

      final fileBytes = await file.readAsBytes();
      await File(downloadPath).writeAsBytes(fileBytes);

      // Show a success message or perform further actions if needed
      print('File downloaded successfully: $downloadPath');
    } catch (e) {
      // Handle any errors that occur during the download process
      print('Error downloading file: $e');
    }
  }
}
