import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double? h;

double? w;

//Images

const String weblogo = 'assets/logo/websitelogo.png';
//const String navlogo = 'assets/weblogo.png';

const String image1 = 'assets/images/desktopchat.png';
const String image2 = 'assets/images/chatgirl.png';
const String image3 = 'assets/images/logwork.jpg';
const String image4 = 'assets/images/worlwide.png';
const String image5 = 'assets/images/woodtypes.png';
const String image6 = 'assets/images/handcraft.jpg';

//mainfeatures gif
const String gif1 = 'assets/gif/security.gif';
const String gif2 = 'assets/gif/control.gif';
const String gif3 = 'assets/gif/quickstart.gif';
const String gif4 = 'assets/gif/statistic.gif';
const String gif5 = 'assets/gif/filter.gif';
const String gif6 = 'assets/gif/group.gif';
const String gif7 = 'assets/gif/autoreply.gif';
const String gif8 = 'assets/gif/multimedia.gif';
const String gif9 = 'assets/gif/world.gif';
//social media
const String fb = 'assets/blackfacebook.png';
const String insta = 'assets/blackinstagram.png';
const String linked = 'assets/blacklinkedin.png';

//backgound
const String bg = 'assets/background.png';

List<IconData> DrawerIcons = [
  Icons.home,
  Icons.menu_book_outlined,
  Icons.contact_page_outlined,
  Icons.currency_rupee_outlined,
  //Icons.get_app_outlined,
];
List<String> DrawerTitles = [
  "Home",
  "Features",
  "Contact US",
  "Pricing",
];

void login_launchURL() async {
  const String _url = 'https://app.profinix.tech';
  Uri url = Uri.parse(_url);
  try {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  } catch (e) {
    print(e);
  }
}

void download_application_windows() async {
  const String _url =
      "https://www.dropbox.com/scl/fi/19d16z22lfdw15szhgwt7/profinix_windows_x64_v1_0.zip?rlkey=shcxau3ozqt04s26nu1l278wv&st=c75xx4vd&dl=1";
  Uri url = Uri.parse(_url);

  try {
    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_blank',
    );
  } catch (e) {
    print(e);
  }
}
