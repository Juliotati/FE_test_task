library posts;

import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:fe_test_task/core/config/routes/routes.gr.dart';
import 'package:fe_test_task/core/core.dart';
import 'package:fe_test_task/core/errors/exeception.dart';
import 'package:fe_test_task/core/errors/failures.dart';
import 'package:fe_test_task/features/posts/data/datasources/local_datasource.dart';
import 'package:fe_test_task/features/posts/data/datasources/remote_datasource.dart';
import 'package:fe_test_task/features/posts/data/models/post_model.dart';

part 'presentation/provider/posts_provider.dart';
part 'presentation/screens/post_details.dart';
part 'presentation/screens/posts.dart';
part 'presentation/widgets/post_builder.dart';
part 'presentation/widgets/post_card.dart';
part 'presentation/widgets/refresh_button.dart';
