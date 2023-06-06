import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'my_bloc_observer.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  Bloc.observer = MyBlocObserver();
}
