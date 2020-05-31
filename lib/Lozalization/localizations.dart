
import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:mojtam3/Lozalization/l10n/messages_all.dart';
//import 'package:mojtam3/Lozalization/l10n/messages_all.dart';
//import 'package:test_app/l10n/messages_all.dart';
//import 'l10n/messages_all.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

   return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }


  String get locale {
    return Intl.message('en', name: 'locale');
  }
  String get lblname {
    return Intl.message('Name', name: 'lblname');
  }
  String get lblemail {
    return Intl.message('Email', name: 'lblemail');
  }
  String get lblpassword {
    return Intl.message('Password', name: 'lblpassword');
  }
  String get lblsignup {
    return Intl.message('Signup', name: 'lblsignup');
  }
    String get lblsignout {
    return Intl.message('signout', name: 'lblsignout');
  }
  String get lblcreatenewaccount {
    return Intl.message('Create New Account', name: 'lblcreatenewaccount');
  }
  String get lbldidforgetpassword {
    return Intl.message('Did Forget Password ? ', name: 'lbldidforgetpassword');
  }
  String get lblagreetothetermsandconditions{
    return Intl.message('Agree to The Terms and Conditions', name: 'lblagreetothetermsandconditions');
  }
  String get lblyouhave{
    return Intl.message('You have Account ?', name: 'lblyouhave');
  }
  String get lblyouhavenot{
    return Intl.message('You havenot Account ?', name: 'lblyouhavenot');
  }
  String get lblsend{
    return Intl.message('Send', name: 'lblsend');
  }
  String get lblresend{
    return Intl.message('Resend', name: 'lblresend');
  }
  String get lblenteremail {
    return Intl.message('Enter Email', name: 'lblenteremail');
  }
  String get lblverificationcode {
    return Intl.message('Verification Code', name: 'lblverificationcode');
  }
  String get lblVerification {
    return Intl.message('Verification', name: 'lblVerification');
  }
  String get lblSetsthenewpassword {
    return Intl.message('New Password', name: 'lblSetsthenewpassword');
  }
  String get lblConfirmthenewpassword {
    return Intl.message('Confirm Password', name: 'lblConfirmthenewpassword');
  }
  String get lblSave {
    return Intl.message('Save', name: 'lblSave');
  }
  String get lblContacts {
    return Intl.message('Contacts', name: 'lblContacts');
  }
  String get lblFrinds {
    return Intl.message('Friends', name: 'lblFrinds');
  }
  String get lblDescover {
    return Intl.message('Discover', name: 'lblDescover');
  }
  String get lblMain {
    return Intl.message('Home', name: 'lblMain');
  }
  String get lblViprooms {
    return Intl.message('VIP Room', name: 'lblViprooms');
  }
  String get lblActiverooms {
    return Intl.message('Active Room', name: 'lblActiverooms');
  }
  String get lblRooms {
    return Intl.message('Rooms', name: 'lblRooms');
  }
  String get lblSearch {
    return Intl.message('Search ...', name: 'lblSearch');
  }
  String get lblActivenow {
    return Intl.message('Active', name: 'lblActivenow');
  }
  String get lblMarket {
    return Intl.message('Market', name: 'lblMarket');
  }
  String get lblInvitefriends {
    return Intl.message('Invite Friends', name: 'lblInvitefriends');
  }
  String get lblAccolade {
    return Intl.message('Accolade', name: 'lblAccolade');
  }
  String get lblDiscutions {
    return Intl.message('Discustions', name: 'lblDiscutions');
  }
  String get lblFriendsRequest {
    return Intl.message('Friends Request', name: 'lblFriendsRequest');
  }
  String get lblActivefriend {
    return Intl.message('Active Friends', name: 'lblActivefriend');
  }
  String get lblNonactivefriend {
    return Intl.message('Non Active friends', name: 'lblNonactivefriend');
  }
  String get lblcontactus {
    return Intl.message('Contact US', name: 'lblcontactus');
  }
  String get lblTechnicalsupport {
    return Intl.message('Technical Support', name: 'lblTechnicalsupport');
  }
  String get lblSystemmessage {
    return Intl.message('System Messages', name: 'lblSystemmessage');
  }
  String get lblMoment {
    return Intl.message('Moment', name: 'lblMoment');
  }
  String get lblStatus {
    return Intl.message('Stutus', name: 'lblStatus');
  }
  String get lblLanguage {
    return Intl.message('Language', name: 'lblLanguage');
  }
  String get lblSerialNumber {
    return Intl.message('Serial Number', name: 'lblSerialNumber');
  }
  String get lblBalance {
    return Intl.message('Balance', name: 'lblBalance');
  }
  String get lblGetmore {
    return Intl.message('More', name: 'lblGetmore');
  }
  String get lblControlgames {
    return Intl.message('Control Games', name: 'lblControlgames');
  }
  String get lblBotsgames {
    return Intl.message('Bots Games', name: 'lblBotsgames');
  }
  String get lblBotsService {
    return Intl.message('Bots Service', name: 'lblBotsService');
  }
  String get lbllogin {
    return Intl.message('Login', name: 'lbllogin');
  }
  String get lblgamesandBots {
    return Intl.message('Gamees & Bots', name: 'lblgamesandBots');
  }
  String get lblpay {
    return Intl.message('payment', name: 'lblpay');
  }
  String get lblwithVisa {
    return Intl.message('With VISA', name: 'lblwithVisa');
  }
  String get lblwithMada {
    return Intl.message('With MADA', name: 'lblwithMada');
  }
  String get lblMastercart {
    return Intl.message('With MASTER Card', name: 'lblMastercart');
  }
  String get lblBuyCoins {
    return Intl.message('BuyCoins', name: 'lblBuyCoins');
  }
  String get lblChargeOffer {
    return Intl.message('ChargeOffers', name: 'lblChargeOffer');
  }
  String get lblConfirmpayment {
    return Intl.message('Confirm Payment', name: 'lblConfirmpayment');
  }
  String get lblCardNumber {
    return Intl.message('Card Number', name: 'lblCardNumber');
  }
  String get lblNameOfCardOwner {
    return Intl.message('Name of Card Owner', name: 'lblNameOfCardOwner');
  }
  String get lblExpiryDate {
    return Intl.message('Expiry Date', name: 'lblExpiryDate');
  }
  String get lblSecretNumber {
    return Intl.message('Secret Number', name: 'lblSecretNumber');
  }
  String get lblConfirm {
    return Intl.message('Confirm', name: 'lblConfirm');
  }
  String get lblChangeEmailandPassword {
    return Intl.message('Change Email And Password', name: 'lblChangeEmailandPassword');
  }
  String get lblOldPassword {
    return Intl.message('Old Password', name: 'lblOldPassword');
  }
  String get lblFriendRequest {
    return Intl.message('Friend Request', name: 'lblFriendRequest');
  }
  String get lblEnterIDwhichYouNeedToAdd {
    return Intl.message('Enter ID which you need to add', name: 'lblEnterIDwhichYouNeedToAdd');
  }
  String get lblUserName {
    return Intl.message('User Name', name: 'lblUserName');
  }
  String get lblCancel {
    return Intl.message('Cancel', name: 'lblCancel');
  }
  String get lblAdd {
    return Intl.message('ADD', name: 'lblAdd');
  }
  String get lblPasswordRecovery {
    return Intl.message('Password Recovery', name: 'lblPasswordRecovery');
  }
  String get lblEnterEmail {
    return Intl.message('Enter Email', name: 'lblEnterEmail');
  }
  String get lblIdNumber {
    return Intl.message('ID Number', name: 'lblIdNumber');
  }
  String get lblRoomOwner {
    return Intl.message('Rome Owner', name: 'lblRoomOwner');
  }
  String get lblRoomMemmber {
    return Intl.message('Room Member', name: 'lblRoomMemmber');
  }
  String get lblJoin {
    return Intl.message('Join', name: 'lblJoin');
  }
  String get lblBuyGifForYourRoom{
    return Intl.message('Buy Gifs for your room', name: 'lblBuyGifForYourRoom');
  }
  String get lblBuyGifForYourAccount{
    return Intl.message('Buy Gifs for your Account', name: 'lblBuyGifForYourAccount');
  }
  String get lblBuyGameForYourRoom{
    return Intl.message('Buy Game for your room', name: 'lblBuyGameForYourRoom');
  }
  String get lblBuyGameForYourAccount{
    return Intl.message('Buy Game for your account', name: 'lblBuyGameForYourAccount');
  }
  String get lblDistinguishyourroomandplaceitintheviprooms{
    return Intl.message('Distinguish your room and place it in VIP rooms', name: 'lblDistinguishyourroomandplaceitintheviprooms');
  }
  String get lblEditProfile{
    return Intl.message('Edit Profile', name: 'lblEditProfile');
  }
  String get lblAccount{
    return Intl.message('Account', name: 'lblAccount');
  }
  String get lblBirthDay{
    return Intl.message('BirthDay', name: 'lblBirthDay');
  }
  String get lblGender{
    return Intl.message('Gender', name: 'lblGender');
  }
  String get lblMale{
    return Intl.message('Male', name: 'lblMale');
  }
  String get lblFemale{
    return Intl.message('Female', name: 'lblFemale');
  }
  String get lblAddMoments{
    return Intl.message('Add Moments', name: 'lblAddMoments');
  }
  String get lblCreateRoom{
    return Intl.message('Create discution Room', name: 'lblCreateRoom');
  }
  String get lblDescription{
    return Intl.message('Description', name: 'lblDescription');
  }
  String get lblCreate{
    return Intl.message('Create', name: 'lblCreate');
  }
  String get lblSetting{
    return Intl.message('Setting', name: 'lblSetting');
  }
  String get lblAcceptToReceiveMessageFromAllUsers{
    return Intl.message('Accept to receive message from all users', name: 'lblAcceptToReceiveMessageFromAllUsers');
  }
  String get lblTermsandConditions{
    return Intl.message('Terms and Conditions', name: 'lblTermsandConditions');
  }
  String get lblTheAppearance{
    return Intl.message('Appearance', name: 'lblTheAppearance');
  }
  String get lblDarkMode{
    return Intl.message('Dark Mode', name: 'lblDarkMode');
  }
  String get lblChatBackgroundColor{
    return Intl.message('Chat Background Color', name: 'lblChatBackgroundColor');
  }
  String get lblAlerts{
    return Intl.message('Alerts', name: 'lblAlerts');
  }
  String get lblSoundsOfAlerts{
    return Intl.message('Sounds Of Alerts', name: 'lblSoundsOfAlerts');
  }
  String get lblSoundsOfPrivateAlerts{
    return Intl.message('Sounds Of Private Alerts', name: 'lblSoundsOfPrivateAlerts');
  }
  String get lblSoundsOfRoomAlerts{
    return Intl.message('Sounds Of Room Alerts', name: 'lblSoundsOfRoomAlerts');
  }
  String get lblPublic{
    return Intl.message('Public', name: 'lblPublic');
  }
  String get lblJoinToRoom{
    return Intl.message('Join To Room', name: 'lblJoinToRoom');
  }
  String get lblDistinguishyourroomandplaceitintheviproomsForThreeDays{
    return Intl.message('Distinguish your room and place it in VIP rooms for 3 days', name: 'lblDistinguishyourroomandplaceitintheviproomsForThreeDays');
  }
  String get lblRomeName{
    return Intl.message('Rome Name', name: 'lblRomeName');
  }
  String get lblBuyIDs{
    return Intl.message('Buy IDs', name: 'lblBuyIDs');
  }
  String get lblBuyGIF{
    return Intl.message('Buy GIF', name: 'lblBuyGIF');
  }
  String get lblDistinguishedRoom{
    return Intl.message('Distinguished Room', name: 'lblDistinguishedRoom');
  }
  String get lblFirstLevel{
    return Intl.message('First Level', name: 'lblFirstLevel');
  }
  String get lblSecondLevel{
    return Intl.message('Second Level', name: 'lblSecondLevel');
  }
  String get lblThirdLevel{
    return Intl.message('Third Level', name: 'lblThirdLevel');
  }
  String get lblActiviee{
    return Intl.message('Active', name: 'lblActiviee');
  }
  String get lblInactivee{
    return Intl.message('Inactive', name: 'lblInactivee');
  }

  String get lblBuyIdForAccount{
    return Intl.message('Buy Id For Account', name: 'lblBuyIdForAccount');
  }

  String get lblBuyIdForRoom{
    return Intl.message('Buy Id For Room', name: 'lblBuyIdForRoom');
  }

  String get lblEnterTheNameOfRoomOrIDToJoin{
    return Intl.message('Enter The Name Of Room Or ID To Join', name: 'lblEnterTheNameOfRoomOrIDToJoin');
  }
  String get lblDetails{
    return Intl.message('Details', name: 'lblDetails');
  }

  String get lblAboatGroup{
    return Intl.message('Aboat Group', name: 'lblAboatGroup');
  }
  String get lblAddPerson{
    return Intl.message('Add Person', name: 'lblAddPerson');
  }
  String get lblversion{
    return Intl.message('Version number', name: 'lblversion');
  }
  String get lblRS{
    return Intl.message('R.S', name: 'lblRS');
  }
  String get lblInformatonBefor{
    return Intl.message('Information befor', name: 'lblInformatonBefor');
  }
  String get lblDeleteAccount{
    return Intl.message('DELET ACCOUNT', name: 'lblDeleteAccount');
  }
  String get lblMembers{
    return Intl.message('Members', name: 'lblMembers');
  }
  String get lblWhoInviteMe{
    return Intl.message('Who Invite Me', name: 'lblWhoInviteMe');
  }
  String get lblInvited{
    return Intl.message('Invited', name: 'lblInvited');
  }
  String get lblChangePassword{
    return Intl.message('Change password', name: 'lblChangePassword');
  }
    String get lblTheFriendShipRequestHasBeenSent{
    return Intl.message('🥳The friendship request has been sent🥳', name: 'lblTheFriendShipRequestHasBeenSent');
  }
     String get lblYouAreAlreadyFriend{
    return Intl.message('🙈 You are already a friend 🙈', name: 'lblYouAreAlreadyFriend');
  }
     String get lblNoOnlineFriends{
    return Intl.message('😓 There are no online friends 😓', name: 'lblNoOnlineFriends');
  }
     String get lblThereAreNoFriendRequests{
    return Intl.message('😓 There are no friend requests 😓', name: 'lblThereAreNoFriendRequests');
  }
     String get lblNoOfflineFriends{
    return Intl.message('😓 There are no offline  friends 😓', name: 'lblNoOfflineFriends');
  }
     String get lblNoSystemMessages{
    return Intl.message('😓 There are no system messages 😓', name: 'lblNoSystemMessages');
  }
       String get lblNoInternetConnection{
    return Intl.message('😓😓There are no internet connection😓😓', name: 'lblNoInternetConnection');
  }
         String get lblCoins{
    return Intl.message('Coins', name: 'lblCoins');
  }
     String get lblsuccess{
    return Intl.message('Success', name: 'lblsuccess');
  }
       String get lblerror{
    return Intl.message('Error', name: 'lblerror');
  }
         String get lblwronginfo{
    return Intl.message('😂 Wrong Email or Password 😂', name: 'lblwronginfo');
  }
           String get lblemailalreadyused{
    return Intl.message('this email is already used', name: 'lblemailalreadyused');
  }
             String get lblAccept{
    return Intl.message('Accept', name: 'lblAccept');
  }
               String get lblDenay{
    return Intl.message('Denay', name: 'lblDenay');
  }
                String get lblban{
    return Intl.message('Ban', name: 'lblban');
  }
                  String get lblunpan{
    return Intl.message('Unban', name: 'lblunpan');
  }
                   String get lblnofrindsyet{
    return Intl.message('😉 No friends yet plz add some 😉', name: 'lblnofrindsyet');
  }
                     String get lblnoroomsyet{
    return Intl.message(' Opps! you not join to any Room yet 🤨 go and join 😉', name: 'lblnoroomsyet');
  }
                       String get lblyoubuyid{
    return Intl.message(' 🤩 your Id changed 🤩 ', name: 'lblyoubuyid');
  }
                         String get lblyoubuyidfriend{
    return Intl.message(' 🤩 your  friend Id changed 🤩 ', name: 'lblyoubuyidfriend');
  }
                           String get lblyoubuyidfriendroom{
    return Intl.message(' 🤩 your  friend room Id changed 🤩 ', name: 'lblyoubuyidfriendroom');
  }
                         String get lblyouhavenocoin{
    return Intl.message('  you have no coin 😏 buy now to increase your level 🤩 ', name: 'lblyouhavenocoin');
  }
                           String get lblfriendnotfound{
    return Intl.message('👻 friend not found 👻', name: 'lblfriendnotfound');
  }
                             String get lblwrongroomid{
    return Intl.message('👻 Room not found 👻', name: 'lblwrongroomid');
  }
                         String get lblyoubuygif{
    return Intl.message(' 🤩 your profile photo changed 🤩 ', name: 'lblyoubuygif');
  }
                          String get lblyoubuygiffriend{
    return Intl.message(' 🤩 your  friend photo changed 🤩 ', name: 'lblyoubuygiffriend');
  }
                           String get lblyoubuygiffriendroom{
    return Intl.message(' 🤩 your  friend room photo changed 🤩 ', name: 'lblyoubuygiffriendroom');
  }
                             String get lblthisIdusedbefor{
    return Intl.message(' 🥺 This Id used befor 🥺 ', name: 'lblthisIdusedbefor');
  }
                               String get lblmyrooms{
    return Intl.message(' My Rooms ', name: 'lblmyrooms');
  }
                       String get lblnomyroomsyet{
    return Intl.message(' Opps! you not create any Room yet 🤨 go and create 😉', name: 'lblnoroomsyet');
  }
                            String get lblyoubuygifroom{
    return Intl.message(' 🤩 your room photo changed 🤩 ', name: 'lblyoubuygifroom');
  }
                            String get lblyoubuyidroom{
    return Intl.message(' 🤩 your room Id changed 🤩 ', name: 'lblyoubuyidroom');
  }
                             String get lblpostionreceved{
    return Intl.message(' 🥺 This Position reseved Currently 🥺 ', name: 'lblpostionreceved');
  }
                           String get lblfirstpostion{
    return Intl.message(' 🤩 your room now in 🔥First Postion🔥 🤩 ', name: 'lblfirstpostion');
  }
                            String get lblsecondpostion{
    return Intl.message(' 🤩 your room now in 🔥Second Postion🔥 🤩 ', name: 'lblsecondpostion');
  }
                              String get lblthirdpostion{
    return Intl.message(' 🤩 your room now in 🔥Third Postion🔥 🤩 ', name: 'lblthirdpostion');
  }
                               String get lblfriendrefuse{
    return Intl.message('😭 you refuse friend request 😭', name: 'lblfriendrefuse');
  }
                               String get lblfriendadded{
    return Intl.message('🤩 friend added check in chats page 🤩', name: 'lblfriendadded');
  }
                                 String get lblacceptnotfromrooms{
    return Intl.message('🤩 Accept Notifcation from Rooms 🤩', name: 'lblacceptnotfromrooms');
  }
                                   String get lblrefusefromrooms{
    return Intl.message('🥺 Refuse Notifcation from Rooms 🥺', name: 'lblrefusefromrooms');
  }
                                 String get lblacceptnotfromchats{
    return Intl.message('🤩 Accept Notifcation from Chats 🤩', name: 'lblacceptnotfromchats');
  }
                                   String get lblrefusefromchats{
    return Intl.message('🥺 Refuse Notifcation from chats  🥺', name: 'lblrefusefromchats');
  }
                                   String get lblacceptnotfromsystemmessage{
    return Intl.message('🤩 Accept Notifcation from System 🤩', name: 'lblacceptnotfromsystemmessage');
  }
                                   String get lblrefusefromsystemmessage{
    return Intl.message('🥺 Refuse Notifcation from System 🥺', name: 'lblrefusefromsystemmessage');
  }
                                     String get lblyoujoindroom{
    return Intl.message('🤩 you just joind to room check in friends page 🤩', name: 'lblyoujoindroom');
  }
                                       String get lblyouarealreadyinroom{
    return Intl.message('🤩 you are already in this room 🤩', name: 'lblyouarealreadyinroom');
  }
                                         String get lblyouarealreadyfrinds{
    return Intl.message('🤩 you are already friends 🤩', name: 'lblyouarealreadyfrinds');
  }
                                           String get lblyouinvitefriend{
    return Intl.message('🤩 thanks you for that 🤩', name: 'lblyouinvitefriend');
  }
                                           String get lblcannotinvint{
    return Intl.message('🤩 sorry you use it befor🤩', name: 'lblcannotinvint');
  }
                                             String get lblthisnameisused{
    return Intl.message('🤩 this name is used 🤩', name: 'lblthisnameisused');
  }
                                               String get lbldownload{
    return Intl.message('DownLoad', name: 'lbldownload');
  }
                                                 String get lblcancelfriend{
    return Intl.message('Cancel Friend Request', name: 'lblcancelfriend');
  }
                                                  String get lblyouaresusbended{
    return Intl.message('you suspend from this Room', name: 'lblyouaresusbended');
  }
  //                    String get lblenterfriendid{
  //   return Intl.message('Enter ID', name: 'lblenterfriendid');
  // }friend added check in chats page
}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

class FallbackCupertinoLocalisationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<CupertinoLocalizations> load(Locale locale) => SynchronousFuture<_DefaultCupertinoLocalizations>(_DefaultCupertinoLocalizations(locale));

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}

class _DefaultCupertinoLocalizations extends DefaultCupertinoLocalizations {
  final Locale locale;

  _DefaultCupertinoLocalizations(this.locale);


}
