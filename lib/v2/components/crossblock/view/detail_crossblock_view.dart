import 'package:ehp/v2/components/crossblock/model/crossblock_realm_model.dart';
import 'package:flutter/material.dart';

import '../../../helper/utils/colors.dart';
import '../../../helper/utils/textfield/custom_textfield_with_title.dart';

class DetailCrossblockView extends StatefulWidget {
  final crossblockRealmModel dataCrosBlock;

  const DetailCrossblockView({
    super.key,
    required this.dataCrosBlock,
  });

  @override
  State<DetailCrossblockView> createState() => _DetailCrossblockViewState();
}

class _DetailCrossblockViewState extends State<DetailCrossblockView> {
  late final TextEditingController titleController;
  late final TextEditingController blockIdController;
  late final TextEditingController notesController;

  @override
  void initState() {
    titleController = TextEditingController();
    blockIdController = TextEditingController();
    notesController = TextEditingController();
    titleController.text = widget.dataCrosBlock.title;
    blockIdController.text = widget.dataCrosBlock.blockID;
    notesController.text = widget.dataCrosBlock.notes;

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    blockIdController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CROSS BLOCK DETAIL",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: primaryColor, width: 2),
              ),
              child: Column(
                children: [
                  CustomTextfieldWithTitle(
                    title: "Title",
                    controller: titleController,
                    validator: null,
                    readOnly: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextfieldWithTitle(
                    title: "Block",
                    controller: blockIdController,
                    validator: null,
                    readOnly: true,
                  ),
                  const SizedBox(height: 10),
                  CustomTextfieldWithTitle(
                    title: "Notes",
                    controller: notesController,
                    maxLines: 5,
                    validator: null,
                    readOnly: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
