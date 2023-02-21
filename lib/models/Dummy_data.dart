class DummyData {
  static List<FriendNames> friendname = [
    FriendNames(name: "Persons Name", image: 'assets/images/girl.png', tegs: 'Hey There!',status: false ),
    FriendNames(name: "Persons Name", image: 'assets/images/style.png', tegs: 'Hey There!',status: false ),
    FriendNames(name: "Persons Name", image: 'assets/images/friend.png', tegs: 'Hey There!',status: false ),
    FriendNames(name: "Persons Name", image: 'assets/images/style.png', tegs: 'Hey There!',status: false ),
    FriendNames(name: "Persons Name", image: 'assets/images/Man.png', tegs: 'Hey There!', status: false),
    FriendNames(name: "Persons Name", image: 'assets/images/style.png', tegs: 'Hey There!', status: false),
  ];
}

class FriendNames{
  String name;
  String image;
  String tegs;
  bool status;


  FriendNames({
    required this.name,
    required this.image,
    required this.tegs,
    required this.status
  });
}

class DummyData1 {
  static List<UserNames> username = [
    UserNames(name: "Username", image: 'assets/images/girl.png', tegs: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua', ),
    UserNames(name: "Username", image: 'assets/images/style.png', tegs: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua', ),
    UserNames(name: "Username", image: 'assets/images/friend.png', tegs: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua', ),
    UserNames(name: "Username", image: 'assets/images/style.png', tegs: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua', ),
    UserNames(name: "Username", image: 'assets/images/Man.png', tegs: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua', ),
    UserNames(name: "Username", image: 'assets/images/style.png', tegs: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do \neiusmod tempor incididunt ut labore et dolore magna aliqua', ),
  ];
}
class UserNames{
  String name;
  String image;
  String tegs;

  UserNames({
    required this.name,
    required this.image,
    required this.tegs,
  });
}

class DummyData2 {
  static List<ProfileName> person = [
    ProfileName(name: "Hi Agency Name", image: 'assets/images/girl.png', tegs: 'Person@Gmail.Com', ),
  ];
}
class ProfileName{
  String name;
  String image;
  String tegs;

  ProfileName({
    required this.name,
    required this.image,
    required this.tegs,
  });
}


class DummyData3 {
  static List<OfficerName> officername = [
    OfficerName(name: "Officer Name", image: 'assets/images/girl.png', tegs: 'View Details', ),
    OfficerName(name: "Officer Name", image: 'assets/images/style.png', tegs: 'View Details', ),
    OfficerName(name: "Officer Name", image: 'assets/images/friend.png', tegs: 'View Details', ),
    OfficerName(name: "Officer Name", image: 'assets/images/style.png', tegs: 'View Details', ),
    OfficerName(name: "Officer Name", image: 'assets/images/Man.png', tegs: 'View Details', ),

  ];
}

class OfficerName{
  String name;
  String image;
  String tegs;


  OfficerName({
    required this.name,
    required this.image,
    required this.tegs,
  });
}

class DummyData4 {
  static List<OfficerManage> officermanage = [
    OfficerManage(name: "Officer Name", image: 'assets/images/girl.png', tegs: 'Designation', ),
    OfficerManage(name: "Officer Name", image: 'assets/images/style.png', tegs: 'Designation', ),
    OfficerManage(name: "Officer Name", image: 'assets/images/friend.png', tegs: 'Designation', ),
    OfficerManage(name: "Officer Name", image: 'assets/images/style.png', tegs: 'Designation', ),
    OfficerManage(name: "Officer Name", image: 'assets/images/Man.png', tegs: 'Designation', ),

  ];
}

class OfficerManage{
  String name;
  String image;
  String tegs;


  OfficerManage({
    required this.name,
    required this.image,
    required this.tegs,
  });
}
