import 'package:messdienerplan_webinterface/misc/navigation/vdialog_page.dart';
import 'package:messdienerplan_webinterface/views/acolyte_view/acolyte_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_add_view.dart';
import 'package:messdienerplan_webinterface/views/group_view/group_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_add_view.dart';
import 'package:messdienerplan_webinterface/views/location_view/location_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_add_view.dart';
import 'package:messdienerplan_webinterface/views/role_view/role_view.dart';
import 'package:messdienerplan_webinterface/widgets/skeletons/base_skeleton/base_skeleton.dart';
import 'package:vrouter/vrouter.dart';

const plans = '/plans';

const acolytes = '/acolytes';

const locations = '/locations';
const locationsAdd = '/locations/add';

const roles = '/roles';
const rolesAdd = '/roles/add';

const groups = '/groups';
const groupsAdd = '/groups/add';

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
        path: locationsAdd,
        widget: LocationAddView(),
      )
    ],
  ),
  VWidget(
    path: roles,
    widget: BaseSkeleton(
      child: RoleView(),
    ),
    stackedRoutes: [
      VDialogPage(
        path: rolesAdd,
        widget: RoleAddView(),
      )
    ],
  ),
  VWidget(
    path: groups,
    widget: BaseSkeleton(
      child: GroupView(),
    ),
    stackedRoutes: [
      VDialogPage(
        path: groupsAdd,
        widget: GroupAddView(),
      )
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
