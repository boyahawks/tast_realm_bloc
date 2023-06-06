import 'package:ehp/v2/components/crossblock/model/crossblock_realm_model.dart';
import 'package:ehp/v2/helper/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/utils/colors.dart';
import '../../../helper/utils/constants.dart';
import '../../../helper/utils/dialog/custom_dialog.dart';
import '../../../helper/utils/state_util.dart';
import '../../../helper/utils/textfield/custom_textfield_with_title.dart';
import '../../../helper/utils/validator/validator.dart';
import '../controllers/bloc/crossblock_realm_bloc.dart';
import 'crossblock_view.dart';

class AddCrossblockView extends StatefulWidget {
  const AddCrossblockView({super.key});

  @override
  State<AddCrossblockView> createState() => _AddCrossblockViewState();
}

class _AddCrossblockViewState extends State<AddCrossblockView> {
  late final TextEditingController titleController;
  late final TextEditingController blockIdController;
  late final TextEditingController notesController;

  @override
  void initState() {
    titleController = TextEditingController();
    blockIdController = TextEditingController();
    notesController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    blockIdController.dispose();
    notesController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CrossblockRealmBloc()..add(const CrossblockRealmGenerateIdEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CROSS BLOCK",
          ),
          actions: [
            BlocConsumer<CrossblockRealmBloc, CrossblockRealmState>(
              listener: (context, state) {
                if (state.addState == RequestState.loading) {
                  CustomDialog.showLoading(context);
                }
                if (state.addState == RequestState.error) {
                  CustomDialog.hideLoading(context);
                  CustomDialog.showAlert(
                      "Error", "Gagal Simpan Crossblock", context);
                }
                if (state.addState == RequestState.success) {
                  CustomDialog.hideLoading(context);
                  Get.off(context: context, page: const CrossblockView());
                }
              },
              builder: (context, state) {
                print("id ${state.generateId}");
                return IconButton(
                  onPressed: () {
                    if (state.addState != RequestState.loading) {
                      if (!_formKey.currentState!.validate()) {
                        hideKeyboard(context);
                      } else {
                        hideKeyboard(context);
                        // if (state.dataImages.isEmpty) {
                        //   CustomDialog.showAlert(
                        //       "Information", "Picture masih kosong", context);
                        // } else {
                        crossblockRealmModel data = crossblockRealmModel(
                          id: state.generateId,
                          userID: "23321",
                          title: titleController.text,
                          blockID: blockIdController.text,
                          notes: notesController.text,
                          deviceID: "123321",
                          upload: "false",
                          latitude: "0",
                          longitude: "0",
                          createdDate: DateTime.now().toIso8601String(),
                        );
                        context
                            .read<CrossblockRealmBloc>()
                            .add(CrossblockAddCrossblockRealmEvent(data));
                        // }
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.save,
                    size: 30,
                  ),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
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
                        maxLines: 1,
                        readOnly: false,
                        validator: (value) {
                          return Validator.required(value, "Title harus diisi");
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextfieldWithTitle(
                        title: "Block",
                        controller: blockIdController,
                        maxLines: 1,
                        readOnly: false,
                        validator: (value) {
                          return Validator.required(value, "Title harus diisi");
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTextfieldWithTitle(
                        title: "Notes",
                        controller: notesController,
                        maxLines: 5,
                        readOnly: false,
                        validator: (value) {
                          return Validator.required(value, "Title harus diisi");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
