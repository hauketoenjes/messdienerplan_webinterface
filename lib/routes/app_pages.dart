import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_edit_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_view.dart';
import 'package:messdienerplan_webinterface/views/login_view/login_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/mass_view.dart/mass_acolyte_view/mass_acolyte_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/mass_view.dart/mass_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/plan_edit_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/plan_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_view.dart';
import 'package:messdienerplan_webinterface/views/splash_screen_view/splash_screen_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/type_view.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/base_skeleton.dart';

import 'custom_get_page.dart';
import 'drawer_categories.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH_SCREEN;

  static final routes = <CustomGetPage>[
    CustomGetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => SplashScreenView(),
    ),
    CustomGetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Pläne',
      drawerCategoryName: DrawerCategories.MASS_DATA,
      drawerIcon: Icons.calendar_today_outlined,
      name: AppRoutes.PLANS,
      page: () => BaseSkeleton(child: PlanView()),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_NEW,
      page: () => BaseSkeleton(child: PlanEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_EDIT,
      page: () => BaseSkeleton(child: PlanEditView(false)),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_MASSES,
      page: () => BaseSkeleton(child: MassView()),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_MASSES_ACOLYTES,
      page: () => BaseSkeleton(child: MassAcolyteView()),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Messdiener',
      drawerCategoryName: DrawerCategories.MASS_DATA,
      drawerIcon: Icons.person_outlined,
      name: AppRoutes.ACOLYTES,
      page: () => BaseSkeleton(child: AcolyteView()),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Orte',
      drawerCategoryName: DrawerCategories.MASS_DATA,
      drawerIcon: Icons.map_outlined,
      name: AppRoutes.LOCATIONS,
      page: () => BaseSkeleton(child: LocationView()),
    ),
    CustomGetPage(
      name: AppRoutes.LOCATIONS_NEW,
      page: () => BaseSkeleton(child: LocationEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.LOCATIONS_EDIT,
      page: () => BaseSkeleton(child: LocationEditView(false)),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Rollen',
      drawerCategoryName: DrawerCategories.ACOLYTE_MANAGEMENT,
      drawerIcon: Icons.label_outlined,
      name: AppRoutes.ROLES,
      page: () => BaseSkeleton(child: RoleView()),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Gruppen',
      drawerCategoryName: DrawerCategories.ACOLYTE_MANAGEMENT,
      drawerIcon: Icons.people_outlined,
      name: AppRoutes.GROUPS,
      page: () => BaseSkeleton(child: GroupView()),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Messetypen',
      drawerCategoryName: DrawerCategories.ACOLYTE_MANAGEMENT,
      drawerIcon: Icons.flag_outlined,
      name: AppRoutes.TYPES,
      page: () => BaseSkeleton(child: TypeView()),
    ),
  ];
}
