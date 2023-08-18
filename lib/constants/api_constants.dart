

class Api {
  static const stagingBaseUrl = "http://csa-loadbalancer-staging-1210473277.eu-west-3.elb.amazonaws.com:8000/";
  static const devBaseUrl = "https://csa-loadbalancer-staging-1210473277.eu-west-3.elb.amazonaws.com:8000/";
  static const prodBaseUrl = "https://csa-loadbalancer-staging-1210473277.eu-west-3.elb.amazonaws.com:8000/";

  //register
  static const register = "apis/account_apis/register/";
  //login
  static const login = "apis/account_apis/login/";

  //conferencees
  static const conferences = "apis/conference_apis/conferences/";

  //sites
  static const sites = "apis/site_apis/sites/";

  //venues
  static const venues = "apis/venue_apis/venues";

  //hotels
  static const hotels = "apis/hotel_apis/hotels";

  //incidence
  static const incidents = "apis/incident_apis/incidents/";
}