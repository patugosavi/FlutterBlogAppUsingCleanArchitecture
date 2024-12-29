import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_route/auto_route.dart';
import 'package:blogapp/data/repositories/repository.dart';
import 'package:blogapp/presentation/router/router_imports.gr.dart';
import 'package:blogapp/presentation/screens/general/home/home_model.dart';
import 'package:blogapp/presentation/screens/general/profile/profile_model.dart'
    hide Post;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_bloc/velocity_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../core/constants/my_colors.dart';
import '../../onboard/onboard_view_model.dart';

part 'home.dart';
part 'home_view_model.dart';
part 'home_details.dart';
