part of 'app_pages.dart';

///
/// Die Routen der App. Zu jeder Route sollte es einen Eintrag in [AppPages.routes]
/// geben.
///
class AppRoutes {
  static const SPLASH_SCREEN = '/';
  static const LOGIN = '/login/';

  static const PLANS = '/plans/';
  static const PLANS_EDIT = '/plans/:planId/';
  static const PLANS_NEW = '/plans/new/';
  static const PLANS_MASSES = '/plans/:planId/masses/';
  static const PLANS_MASSES_EDIT = '/plans/:planId/masses/:massId/';
  static const PLANS_MASSES_NEW = '/plans/:planId/masses/new/';
  static const PLANS_MASSES_ACOLYTES =
      '/plans/:planId/masses/:massId/acolytes/';
  static const PLANS_MASSES_ACOLYTES_EDIT =
      '/plans/:planId/masses/:massId/acolytes/:massAcolyteId/';
  static const PLANS_MASSES_ACOLYTES_NEW =
      '/plans/:planId/masses/:massId/acolytes/new/';

  static const ACOLYTES = '/acolytes/';
  static const ACOLYTES_EDIT = '/acolytes/:acolyteId/';
  static const ACOLYTES_NEW = '/acolytes/new/';
  static const ACOLYTES_IMPORT = '/acolytes/import/';
  static const ACOLYTES_MASSES = '/acolytes/:acolyteId/masses/';

  static const LOCATIONS = '/locations/';
  static const LOCATIONS_EDIT = '/locations/:locationId/';
  static const LOCATIONS_NEW = '/locations/new/';

  static const ROLES = '/roles/';
  static const ROLES_EDIT = '/roles/:roleId/';
  static const ROLES_NEW = '/roles/new/';

  static const GROUPS = '/groups/';
  static const GROUPS_EDIT = '/groups/:groupId/';
  static const GROUPS_NEW = '/groups/new/';
  static const GROUPS_CLASSIFICATIONS = '/groups/:groupId/classifications/';
  static const GROUPS_CLASSIFICATIONS_EDIT =
      '/groups/:groupId/classifications/:classificationId/';
  static const GROUPS_CLASSIFICATIONS_NEW =
      '/groups/:groupId/classifications/new/';

  static const TYPES = '/types/';
  static const TYPES_EDIT = '/types/:typeId/';
  static const TYPES_NEW = '/types/new/';
  static const TYPES_RULES = '/types/:typeId/rules/';
  static const TYPES_RULES_EDIT = '/types/:typeId/rules/:ruleId/';
  static const TYPES_RULES_NEW = '/types/:typeId/rules/new/';
  static const TYPES_REQUIREMENTS = '/types/:typeId/requirements/';
  static const TYPES_REQUIREMENTS_EDIT =
      '/types/:typeId/requirements/:requirementId/';
  static const TYPES_REQUIREMENTS_NEW = '/types/:typeId/requirements/new/';

  static const WHATS_NEW = '/whatsnew/';
  static const SETTINGS = '/settings/';
}
