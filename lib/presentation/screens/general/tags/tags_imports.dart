import 'package:auto_route/auto_route.dart';
import 'package:blogapp/data/repositories/repository.dart';
import 'package:blogapp/presentation/enums/navigate_type.dart';
import 'package:blogapp/presentation/router/router_imports.gr.dart';
import 'package:blogapp/presentation/screens/general/tags/tags_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/constants/my_colors.dart';

part 'tags.dart';
part 'tags_view_model.dart';