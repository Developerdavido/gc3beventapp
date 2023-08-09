

class FakeUserRegType {
  String? title;
  String? userType;

  FakeUserRegType(this.title, this.userType);
  
  static List<FakeUserRegType> userTypes = [
    FakeUserRegType("Account creation/\nRegistration Session", "Participants"),
    FakeUserRegType("Users Session", "Administration"),
  ];
}