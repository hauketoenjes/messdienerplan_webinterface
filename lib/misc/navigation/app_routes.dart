import 'package:messdienerplan_webinterface/misc/navigation/vdialog_page.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_update_create_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_update_create_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_update_create_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_view.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/base_skeleton.dart';
import 'package:vrouter/vrouter.dart';

const plans = '/plans';

const acolytes = '/acolytes';

const locations = '/locations';
const locationsCreate = '/locations/add';
const locationsUpdate = '/locations/:locationId';

const roles = '/roles';
const rolesCreate = '/roles/add';
const rolesUpdate = '/roles/:roleId';

const groups = '/groups';
const groupsCreate = '/groups/add';
const groupsUpdate = '/groups/:groupId';

const types = '/types';

final routes = <VRouteElement>[
  VWidget(
    path: plans,
    widget: BaseSkeleton(
      child: AcolyteView(),
    ),
  ),
  VWidget(
    path: acolytes,
    widget: BaseSkeleton(
      child: AcolyteView(),
    ),
  ),
  VWidget(
    path: locations,
    widget: BaseSkeleton(
      child: LocationView(),
    ),
    stackedRoutes: [
      VDialogPage(
        path: locationsCreate,
        widget: LocationUpdateCreateView(),
      ),
      VDialogPage(
        path: locationsUpdate,
        widget: LocationUpdateCreateView(),
      ),
    ],
  ),
  VWidget(
    path: roles,
    widget: BaseSkeleton(
      child: RoleView(),
    ),
    stackedRoutes: [
      VDialogPage(
        path: rolesCreate,
        widget: RoleUpdateCreateView(),
      ),
      VDialogPage(
        path: rolesUpdate,
        widget: RoleUpdateCreateView(),
      ),
    ],
  ),
  VWidget(
    path: groups,
    widget: BaseSkeleton(
      child: GroupView(),
    ),
    stackedRoutes: [
      VDialogPage(
        path: groupsCreate,
        widget: GroupUpdateCreateView(),
      ),
      VDialogPage(
        path: groupsUpdate,
        widget: GroupUpdateCreateView(),
      ),
    ],
  ),
  VWidget(
    path: types,
    widget: BaseSkeleton(
      child: AcolyteView(),
    ),
  ),
  VRouteRedirector(
    path: ':_(.*)',
    redirectTo: acolytes,
  ),
];
