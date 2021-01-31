import 'package:flutter/material.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_edit_view.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_mass_view/acolyte_mass_view.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/classification_view/classification_edit_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/classification_view/classification_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_edit_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_edit_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_view.dart';
import 'package:messdienerplan_webinterface/views/login_view/login_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/mass_view.dart/mass_acolyte_view/mass_acolyte_edit_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/mass_view.dart/mass_acolyte_view/mass_acolyte_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/mass_view.dart/mass_edit_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/mass_view.dart/mass_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/plan_edit_view.dart';
import 'package:messdienerplan_webinterface/views/plan_view/plan_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_edit_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_view.dart';
import 'package:messdienerplan_webinterface/views/splash_screen_view/splash_screen_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/requirement_view/requirement_edit_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/requirement_view/requirement_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/rule_view/rule_edit_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/rule_view/rule_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/type_edit_view.dart';
import 'package:messdienerplan_webinterface/views/type_view/type_view.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/base_skeleton.dart';

import 'custom_get_page.dart';
import 'drawer_categories.dart';

part 'app_routes.dart';

///
/// Die Seiten, die die App hat. Jede Seite zu der navigiert werden kann muss in
/// [routes] definiert werden.
///
/// Wenn eine Seite im Drawer auftauchen soll, dann muss [isDrawerItem] auf true
/// gesetzt werden.
///
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
      drawerCategoryName: DrawerCategories.PLAN_DATA,
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
      name: AppRoutes.PLANS_MASSES_NEW,
      page: () => BaseSkeleton(child: MassEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_MASSES_EDIT,
      page: () => BaseSkeleton(child: MassEditView(false)),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_MASSES_ACOLYTES,
      page: () => BaseSkeleton(child: MassAcolyteView()),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_MASSES_ACOLYTES_NEW,
      page: () => BaseSkeleton(child: MassAcolyteEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.PLANS_MASSES_ACOLYTES_EDIT,
      page: () => BaseSkeleton(child: MassAcolyteEditView(false)),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Messdiener',
      drawerCategoryName: DrawerCategories.PLAN_DATA,
      drawerIcon: Icons.person_outlined,
      name: AppRoutes.ACOLYTES,
      page: () => BaseSkeleton(child: AcolyteView()),
    ),
    CustomGetPage(
      name: AppRoutes.ACOLYTES_NEW,
      page: () => BaseSkeleton(child: AcolyteEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.ACOLYTES_EDIT,
      page: () => BaseSkeleton(child: AcolyteEditView(false)),
    ),
    CustomGetPage(
      name: AppRoutes.ACOLYTES_MASSES,
      page: () => BaseSkeleton(child: AcolyteMassView()),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Orte',
      drawerCategoryName: DrawerCategories.ACOLYTE_MANAGEMENT,
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
      name: AppRoutes.ROLES_NEW,
      page: () => BaseSkeleton(child: RoleEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.ROLES_EDIT,
      page: () => BaseSkeleton(child: RoleEditView(false)),
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
      name: AppRoutes.GROUPS_NEW,
      page: () => BaseSkeleton(child: GroupEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.GROUPS_EDIT,
      page: () => BaseSkeleton(child: GroupEditView(false)),
    ),
    CustomGetPage(
      name: AppRoutes.GROUPS_CLASSIFICATIONS,
      page: () => BaseSkeleton(child: ClassificationView()),
    ),
    CustomGetPage(
      name: AppRoutes.GROUPS_CLASSIFICATIONS_NEW,
      page: () => BaseSkeleton(child: ClassificationEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.GROUPS_CLASSIFICATIONS_EDIT,
      page: () => BaseSkeleton(child: ClassificationEditView(false)),
    ),
    CustomGetPage(
      isDrawerItem: true,
      drawerTitle: 'Messetypen',
      drawerCategoryName: DrawerCategories.ACOLYTE_MANAGEMENT,
      drawerIcon: Icons.flag_outlined,
      name: AppRoutes.TYPES,
      page: () => BaseSkeleton(child: TypeView()),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_NEW,
      page: () => BaseSkeleton(child: TypeEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_EDIT,
      page: () => BaseSkeleton(child: TypeEditView(false)),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_RULES,
      page: () => BaseSkeleton(child: RuleView()),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_RULES_NEW,
      page: () => BaseSkeleton(child: RuleEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_RULES_EDIT,
      page: () => BaseSkeleton(child: RuleEditView(false)),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_REQUIREMENTS,
      page: () => BaseSkeleton(child: RequirementView()),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_REQUIREMENTS_NEW,
      page: () => BaseSkeleton(child: RequirementEditView(true)),
    ),
    CustomGetPage(
      name: AppRoutes.TYPES_REQUIREMENTS_EDIT,
      page: () => BaseSkeleton(child: RequirementEditView(false)),
    ),
  ];
}
