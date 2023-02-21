import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Constants {
  static const String areYouAPoliceOfficer = 'Are you a Police Officer?';
  static const String areYouAnAgency = 'Are you an Agency?';
  static const String logincap = 'LOGIN';
  static const String signupCap = 'SIGN UP';
  static const String email = 'Email';
  static const String no = 'no';
  static const String okay = 'okay';
  static const String somethingWrongError = 'somethingWrongError';
  static const String password = 'Password';
  static const String forgotpassword = 'Forgot Password?';
  static const String login = 'Login';
  static const String reenterpassword = 'Re-enter Password';
  static const String privacypolicy = 'I agree with Privacy Policy';
  static const String signup = 'Sign Up';
  static const String stepverification = '2 Step Verification';
  static const String codeverification =
      'A 6-digit verification code \nwas just sent to ●●●●●●@gmail.com';
  static const String reciveemail = 'Didn’t receive a email?';
  static const String resendcode = 'Resend Code';
  static const String continuekey = 'Continue';
  static const String forgotpasswordkey = 'Forgot Password';
  static const String enteremail = 'Enter email associated with \n your account';
  static const String sendcode = 'Send Code';
  static const String changepassword = 'Change Password';
  static const String currentPassword = 'Current Password';
  static const String code = 'Code';
  static const String newpassword = 'New Password';
  static const String confirmnewpassword = 'Confirm New Password';
  static const String didnotreciveemail = 'Didn’t receive a email?';
  static const String confirm = 'Confirm';
  static const String createprofile = 'Create Profile';
  static const String uploadprofilepic = 'Upload Profile Pic';
  static const String agencyname = 'Agency Name';
  static const String agencybio = 'Agency Bio';
  static const String agencyverification = 'Agency Verification';
  static const String uploadagencycertification = 'Upload Agency Certification';
  static const String agencytext =
      'It can take upto 5 days to verify you. You will be notified by email about your verification status';
  static const String pending = 'Pending';
  static const String agencyverified = 'Agency Verified!';
  static const String search = 'Search';
  static const String askquestion = 'Ask a Question';
  static const String home = 'HOME';
  static const String feed = 'FEED';
  static const String messages = 'MESSAGES';
  static const String profile = 'PROFILE';
  static const String documents = 'Documents';
  static const String laws = 'Laws';
  static const String personalNotes = 'Personal Notes';
  static const String rights = 'Rights';
  static const String filename1 = 'File name#1';
  static const String filename2 = 'File name#2';
  static const String filename3 = 'File name#3';
  static const String filename4 = 'File name#4';
  static const String admin = 'Admin';
  static const String agency = 'Agency';
  static const String Document01 = 'Document 01';
  static const String Document02 = 'Document 02';
  static const String Document03 = 'Document 03';
  static const String Document04 = 'Document 04';
  static const String Document05 = 'Document 05';
  static const String aidabuggnotes = 'Aida Bugg notes';
  static const String teridactylnotes = 'Teri Dactyl notes';
  static const String pegLeggenotes = 'Peg Legge notes';
  static const String aidaBuggtext = 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata.';
  static const String addNotes = 'Add Notes';
  static const String textField = 'Text Field';
  static const String submit = 'Submit';
  static const String rightList = 'Right List';
  static const String typePostCaption = 'Type Post Caption';
  static const String uploadPhotoVideo = 'Upload Photo / Video';
  static const String post = 'Post';
  static const String typemessagehere = 'Type message here..';
  static const String agencyName = 'Agency Name';
  static const String chatwithAgency = 'Chat with Agency';
  static const String editProfile = 'Edit Profile';
  static const String notificationSettings = 'Notification Settings';
  static const String myNotes = 'My Notes';
  static const String officerManagement = 'Officer Management';
  static const String changePassword = 'Change Password';
  static const String privacyPolicy = 'Privacy Policy';
  static const String termsConditions = 'Terms & Conditions';
  static const String aboutUs = 'About Us';
  static const String deleteAccount = 'Delete Account';
  static const String logout = 'Logout';
  static const String editProfilePic = 'Edit Profile Pic';
  static const String agencyBio = 'Agency Bio';
  static const String save = 'Save';
  static const String officerRequest = 'Officer Request';
  static const String officerList = 'Officer List';
  static const String designation = 'Designation';
  static const String contactDetails = 'Contact Details';
  static const String address = 'Address';
  static const String certificate = 'Certificate';
  static const String certificateName = 'Certificate Name';
  static const String view = 'View';
  static const String deny = 'Deny';
  static const String approve = 'Approve';
  static const String policeManagement = 'Police Management';
  static const String officermanagement = 'Officer Management';
  static const String removeOfficer = 'Remove Officer';
  static const String cancel = 'Cancel';
  static const String sure = 'Sure';
  static const String resetpass = 'Reset Password';
  static const String fullname = 'Full Name';
  static const String selectagency = 'Select Agency';
  static const String state = 'State';
  static const String country = 'Country';
  static const String number = '202-555-0177';
  static const String uploadPoliceCertificate = 'Upload Police Certificate';
  static const String policeCertificate = 'Police Certificate';
  static const String verificationPending = 'Verification Pending';
  static const String policeCertificatenote = 'It can take upto 5 days to verify you.\nYou will be notified by email about your verification status';
  static const String deleteacounttext = 'Are you sure you want to delete this account?';
  static const String username = 'Username';
  static const String hiAgencyName = 'Hi Agency Name';
  static const String personGmailCom = 'Person@Gmail.Com';
  static const String newPost = 'New Post';
  static const String startNewChat = 'Start New Chat';
  static const String personsName = 'Persons Name';
  static const internetIssue = 'No Internet';
  static const somethingWentWrong = 'Something went wrong';
  static const netissue = "not internet available";
  static const somethingwrong = 'try again later';
}

// var imageurl = 'https://img.freepik.com/free-photo/close-up-young-successful-man-smiling-camera-standing-casual-outfit-against-blue-background_1258-66609.jpg?w=2000';
//
// FirebaseAuth auth = FirebaseAuth.instance;
//
// DatabaseReference userRef= FirebaseDatabase.instance.ref().child('users');
//
// displayMessage(String message) {
//   Fluttertoast.showToast(msg: message);
// }