import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helper/utils/colors.dart';
import '../../../../helper/utils/dialog/custom_dialog.dart';
import '../../../../helper/utils/state_util.dart';
import '../../controllers/bloc/crossblock_realm_bloc.dart';
import '../../model/crossblock_realm_model.dart';
import '../detail_crossblock_view.dart';

class ContainerCrossblock extends StatelessWidget {
  final crossblockRealmModel data;
  const ContainerCrossblock({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.id,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.notes,
                style: const TextStyle(
                  fontSize: 13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(
                        context: context,
                        page: DetailCrossblockView(dataCrosBlock: data));
                  },
                  child: const Text(
                    "read more ...",
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
              onPressed: () {
                CustomDialog.confirmation(
                  context: context,
                  message:
                      "Apakah anda yakin ingin menghapus data crossblock ini ?",
                  onPressed: () async {
                    context
                        .read<CrossblockRealmBloc>()
                        .add(CrossblockRealmDeleteEvent(data));
                  },
                );
              },
              icon: const Icon(Icons.delete)),
        ),
      ],
    );
  }
}
