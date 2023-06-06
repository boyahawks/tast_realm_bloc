import 'package:ehp/v2/components/crossblock/model/crossblock_realm_model.dart';
import 'package:ehp/v2/helper/utils/state_enum.dart';

import 'package:ehp/v2/components/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helper/utils/colors.dart';
import '../../../helper/utils/dialog/custom_dialog.dart';
import '../../../helper/utils/state_util.dart';
import '../controllers/bloc/crossblock_realm_bloc.dart';
import 'add_crossblock_view.dart';
import 'widgets/container_crossblock.dart';

class CrossblockView extends StatelessWidget {
  const CrossblockView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CrossblockRealmBloc()..add(const CrossblockRealmGetDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CROSS BLOCK LIST"),
          leading: IconButton(
            onPressed: () {
              Get.offAll(context: context, page: const HomeView());
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocConsumer<CrossblockRealmBloc, CrossblockRealmState>(
          listener: (context, state) {
            if (state is CrossBlockRealmDeleteState) {
              if (state.requestState == RequestState.loading) {
                CustomDialog.showLoading(context);
              }
              if (state.requestState == RequestState.error) {
                CustomDialog.hideLoading(context);
                CustomDialog.showAlert(
                    "Error", "Gagal Simpan Crossblock", context);
              }
              if (state.requestState == RequestState.success) {
                CustomDialog.hideLoading(context);
                // Get.off(context: context, page: const CrossblockView());
                context
                    .read<CrossblockRealmBloc>()
                    .add(const CrossblockRealmGetDataEvent());
              }
            }
          },
          builder: (context, state) {
            if (state is CrossBlockRealmGetState) {
              if (state.requestState == RequestState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.datas.isEmpty) {
                return const Center(
                  child: Text("Belum ada data"),
                );
              } else {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.datas.length,
                  padding: const EdgeInsets.all(20.0),
                  itemBuilder: (context, index) {
                    final crossblockRealmModel data = state.datas[index];
                    return ContainerCrossblock(
                      data: data,
                    );
                  },
                );
              }
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              Get.to(context: context, page: const AddCrossblockView()).then(
                  (value) => context
                      .read<CrossblockRealmBloc>()
                      .add(const CrossblockRealmGetDataEvent()));
            },
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          );
        }),
      ),
    );
  }
}
