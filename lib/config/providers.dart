

import 'package:gc3bapp/services/venues_services.dart';
import 'package:gc3bapp/view_models/ConferenceProvider.dart';
import 'package:gc3bapp/view_models/auth_provider.dart';
import 'package:gc3bapp/view_models/hotel_provider.dart';
import 'package:gc3bapp/view_models/site_provider.dart';
import 'package:gc3bapp/view_models/venue_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthProvider>.value(value: AuthProvider()),
  ChangeNotifierProvider<ConferenceProvider>.value(value: ConferenceProvider()),
  ChangeNotifierProvider<SiteProvider>.value(value: SiteProvider()),
  ChangeNotifierProvider<VenueProvider>.value(value: VenueProvider()),
  ChangeNotifierProvider<HotelProvider>.value(value: HotelProvider()),
];