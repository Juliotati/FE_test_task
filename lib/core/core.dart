library core;

import 'package:fe_test_task/features/posts/data/datasources/local_datasource.dart';
import 'package:fe_test_task/features/posts/posts.dart';
import 'package:fe_test_task/moor/moor_posts.dart';
import 'package:fe_test_task/moor/posts_dao.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fe_test_task/features/posts/data/datasources/remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'network_info.dart';
part 'presentation/navigation/custom_route.dart';
part 'presentation/theme/light.dart';
part 'config/providers.dart';