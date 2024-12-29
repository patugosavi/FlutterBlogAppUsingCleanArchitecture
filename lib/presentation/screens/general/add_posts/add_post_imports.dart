import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blogapp/core/constants/my_colors.dart';
import 'package:blogapp/data/repositories/repository.dart';
import 'package:blogapp/presentation/enums/navigate_type.dart';
import 'package:blogapp/presentation/router/router_imports.gr.dart';
import 'package:blogapp/presentation/screens/general/profile/profile_model.dart';
import 'package:blogapp/presentation/screens/general/tags/tags_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../categories/categories_model.dart';

part 'add_post.dart';
part 'add_post_view_model.dart';