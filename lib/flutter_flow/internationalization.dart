import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'nl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? nlText = '',
  }) =>
      [enText, nlText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // signinPage
  {
    'gztgjeiv': {
      'en': 'Create Account',
      'nl': '',
    },
    'k5g8iekk': {
      'en': 'Create Account',
      'nl': '',
    },
    'on9mdim0': {
      'en': 'Let\'s get started by filling out the form below.',
      'nl': '',
    },
    'pztg21js': {
      'en': 'Email',
      'nl': '',
    },
    'gk9r5b3q': {
      'en': 'Password',
      'nl': '',
    },
    'mmuv0qc8': {
      'en': 'Password',
      'nl': '',
    },
    'zydivaji': {
      'en': 'Get Started',
      'nl': '',
    },
    'c2tqz07j': {
      'en': 'Or sign up with',
      'nl': '',
    },
    'tcoga1xk': {
      'en': 'Continue with Google',
      'nl': '',
    },
    'as207h5u': {
      'en': 'Log In',
      'nl': '',
    },
    'i8qumj34': {
      'en': 'Welcome Back',
      'nl': '',
    },
    'ypa2brwb': {
      'en': 'Fill out the information below in order to access your account.',
      'nl': '',
    },
    'iyrep1f8': {
      'en': 'Email',
      'nl': '',
    },
    'swpdgdg9': {
      'en': 'Password',
      'nl': '',
    },
    '3abaf994': {
      'en': 'Sign In',
      'nl': '',
    },
    'ny611kq9': {
      'en': 'Or sign in with',
      'nl': '',
    },
    'n6ttrz5w': {
      'en': 'Continue with Google',
      'nl': '',
    },
    'ppgre965': {
      'en': 'Forgot Password?',
      'nl': '',
    },
    '9a7tgqyi': {
      'en': 'Home',
      'nl': '',
    },
  },
  // settingsPage
  {
    'alkgyufw': {
      'en': 'Account',
      'nl': '',
    },
    'udbpsvzo': {
      'en': 'Integration With GPTW',
      'nl': '',
    },
    'tg1yxs4v': {
      'en': 'Payment Options',
      'nl': '',
    },
    'okc2mw6k': {
      'en': 'Notification Settings',
      'nl': '',
    },
    'al24cais': {
      'en': 'Edit Profile',
      'nl': '',
    },
    'g2lypz8o': {
      'en': 'General',
      'nl': '',
    },
    '2j72or0r': {
      'en': 'Support',
      'nl': '',
    },
    'cmrzgauy': {
      'en': 'Terms of Service',
      'nl': '',
    },
    '9qqyhntc': {
      'en': 'Profile',
      'nl': '',
    },
    'caiko49f': {
      'en': 'Home',
      'nl': '',
    },
  },
  // editProfilePage
  {
    'izgji3c3': {
      'en': 'Great Place To Work',
      'nl': '',
    },
    'x61axz0w': {
      'en': 'Haarlem',
      'nl': '',
    },
    'tddt4k27': {
      'en': 'Function',
      'nl': '',
    },
    'wsydsx4t': {
      'en': 'Function',
      'nl': '',
    },
    'b43od2gb': {
      'en': 'CEO',
      'nl': '',
    },
    '22fh0o5w': {
      'en': 'CTO',
      'nl': '',
    },
    'hrqlaexb': {
      'en': 'CFO',
      'nl': '',
    },
    'wuyua8b4': {
      'en': 'HR Manager',
      'nl': '',
    },
    'fcvoco3g': {
      'en': 'Innovation Director',
      'nl': '',
    },
    'l6nfte3k': {
      'en': 'SelectFunction At Your Company',
      'nl': '',
    },
    'oxts8gx5': {
      'en': 'CEO',
      'nl': '',
    },
    'wia8cu1v': {
      'en': 'Become a great leader',
      'nl': '',
    },
    'entei2hr': {
      'en': 'Save Changes',
      'nl': '',
    },
    'gsnrwewc': {
      'en': 'Edit your Profile',
      'nl': '',
    },
  },
  // settingsNotificationsPage
  {
    'lc8fjoze': {
      'en': 'Settings Page',
      'nl': '',
    },
    '1r3bc48j': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'nl': '',
    },
    '5xyl4b1r': {
      'en': 'Push Notifications',
      'nl': '',
    },
    'mo5q98ku': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'nl': '',
    },
    'e4x0xmpz': {
      'en': 'Email Notifications',
      'nl': '',
    },
    'zwmnzsnr': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'nl': '',
    },
    'cfi5flwv': {
      'en': 'Location Services',
      'nl': '',
    },
    'tac1n0lp': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'nl': '',
    },
    'c6jgvvhs': {
      'en': 'Change Changes',
      'nl': '',
    },
    've31bfcg': {
      'en': 'Home',
      'nl': '',
    },
  },
  // integrationGptwPage
  {
    'ilyjnqe8': {
      'en': 'Integration with GPTW Survey Data',
      'nl': '',
    },
    'a8gko3jn': {
      'en': 'API Key',
      'nl': '',
    },
    'l19pyjgb': {
      'en': 'Enter your GPTW API key here...',
      'nl': '',
    },
    'q2k91ipk': {
      'en': 'Sync Frequency',
      'nl': '',
    },
    'yhbvu69g': {
      'en': 'Every 24 Hours',
      'nl': '',
    },
    'sjvzoaf2': {
      'en': 'Every 24 Hours',
      'nl': '',
    },
    'l87vzt9k': {
      'en': 'Every Week',
      'nl': '',
    },
    '43bhttl2': {
      'en': 'Every Month',
      'nl': '',
    },
    'd1g2vlgv': {
      'en': 'Every Quarter',
      'nl': '',
    },
    'f6iwxeds': {
      'en': 'Please select Syncing Frequency...',
      'nl': '',
    },
    'aqdc2jhz': {
      'en': 'Search for an item...',
      'nl': '',
    },
    'g33hgf0v': {
      'en': 'Set up Integration',
      'nl': '',
    },
    '4xa2ea52': {
      'en': 'Integrate GPTW',
      'nl': '',
    },
  },
  // chat_ai_Screen
  {
    'x9b0nomq': {
      'en': 'AI Guru',
      'nl': '',
    },
    'msxzse39': {
      'en': 'CultureWise',
      'nl': '',
    },
    '3rzg5sam': {
      'en': 'Dashboard',
      'nl': '',
    },
    'clfbtevj': {
      'en': 'Guru Chat',
      'nl': '',
    },
    '6bvl3rf1': {
      'en': 'MarketYou',
      'nl': '',
    },
    '5ifoej0u': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'z11t8son': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'myan1y30': {
      'en': 'Courses & Events',
      'nl': '',
    },
    't4q3gsto': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'dgtra8ya': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    '319uxcyv': {
      'en': 'Settings',
      'nl': '',
    },
    '7dvi6atg': {
      'en': 'Home',
      'nl': '',
    },
  },
  // homePage
  {
    'q9ap2ltu': {
      'en': 'Team Overview',
      'nl': '',
    },
    'mzk9z8wv': {
      'en': 'Review the details below of your recent projects.',
      'nl': '',
    },
    'll2lqj2r': {
      'en': 'Assign',
      'nl': '',
    },
    'fjv3jq9h': {
      'en': 'Create Task',
      'nl': '',
    },
    '17hi6s2e': {
      'en': 'Tasks Completed',
      'nl': '',
    },
    'dumcbyt8': {
      'en': '255',
      'nl': '',
    },
    'wwig67tx': {
      'en': '32.2%',
      'nl': '',
    },
    '55f95qg3': {
      'en': 'Upcoming Tasks',
      'nl': '',
    },
    'rjxa48ma': {
      'en': '67',
      'nl': '',
    },
    'sofxy3j4': {
      'en': '45.5%',
      'nl': '',
    },
    'zffqkvmq': {
      'en': 'Recent Activity',
      'nl': '',
    },
    '2a848q31': {
      'en': 'Below is an overview of tasks & activity completed.',
      'nl': '',
    },
    'vd1y07pq': {
      'en': 'Tasks',
      'nl': '',
    },
    '1pdyab1l': {
      'en': 'Completed',
      'nl': '',
    },
    's6ngwvbq': {
      'en': 'Upcoming Milestones',
      'nl': '',
    },
    'rpnm2wy8': {
      'en': 'Below are some of the upcoming tasks for your team.',
      'nl': '',
    },
    'bavgcwiy': {
      'en': 'Add New',
      'nl': '',
    },
    'fphw51y4': {
      'en': 'Assigned User',
      'nl': '',
    },
    'qmls77ju': {
      'en': 'Due Date',
      'nl': '',
    },
    '8zwb81wm': {
      'en': 'Status',
      'nl': '',
    },
    'wxbnbwtj': {
      'en': 'Actions',
      'nl': '',
    },
    'cx0wwyh6': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '3ne9mmjj': {
      'en': 'Business Name',
      'nl': '',
    },
    'kg8y3whc': {
      'en': 'Fri. Aug 11th',
      'nl': '',
    },
    '77dtml6k': {
      'en': 'High',
      'nl': '',
    },
    'psex8xeb': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'f3w9i8y1': {
      'en': 'Business Name',
      'nl': '',
    },
    'wtzbx5rr': {
      'en': 'Fri. Aug 11th',
      'nl': '',
    },
    'atbdp0e3': {
      'en': 'High',
      'nl': '',
    },
    'kfi7rxvv': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'slwlcmdv': {
      'en': 'Business Name',
      'nl': '',
    },
    'b9dnoh7p': {
      'en': 'Fri. Aug 11th',
      'nl': '',
    },
    'q5ckgu8j': {
      'en': 'Medium',
      'nl': '',
    },
    'mbukrlsy': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'hhquivuw': {
      'en': 'Business Name',
      'nl': '',
    },
    'ubmrkxao': {
      'en': 'Fri. Aug 11th',
      'nl': '',
    },
    'ihd2x0h2': {
      'en': 'Medium',
      'nl': '',
    },
    '5vabce24': {
      'en': 'Activity',
      'nl': '',
    },
    'lzpr04ga': {
      'en': 'Recent completed tasks from your team.',
      'nl': '',
    },
    'q7jkjve2': {
      'en': 'Rudy Fernandez',
      'nl': '',
    },
    'too5awbz': {
      'en': '4m ago',
      'nl': '',
    },
    'q6gekwyd': {
      'en': 'Completed ',
      'nl': '',
    },
    'bb7mnd1g': {
      'en': 'Marketing Plan',
      'nl': '',
    },
    '5qiit955': {
      'en': 'Rudy Fernandez',
      'nl': '',
    },
    'nxwikwa0': {
      'en': '4m ago',
      'nl': '',
    },
    '1a9h0slo': {
      'en': 'Started ',
      'nl': '',
    },
    'jm76ukb1': {
      'en': 'Marketing Plan',
      'nl': '',
    },
    'ec0xm0qn': {
      'en': 'Abigail Rojas',
      'nl': '',
    },
    'r5zlabws': {
      'en': '4m ago',
      'nl': '',
    },
    'hn9718eo': {
      'en': 'Assigned  ',
      'nl': '',
    },
    'v7w3zrhs': {
      'en': 'Rudy Fernandez ',
      'nl': '',
    },
    '06psjz4c': {
      'en': 'to ',
      'nl': '',
    },
    'ko7o7v6a': {
      'en': 'Marketing Plan',
      'nl': '',
    },
    'q5w4d3bd': {
      'en': 'Abigail Rojas',
      'nl': '',
    },
    '5ntf0c1y': {
      'en': '4m ago',
      'nl': '',
    },
    'td9zq7oc': {
      'en': 'Created a project: ',
      'nl': '',
    },
    'rsqhwvjg': {
      'en': 'Marketing Plan',
      'nl': '',
    },
    'll7yd046': {
      'en': 'Liz Ambridge',
      'nl': '',
    },
    'x6zljzac': {
      'en': '4m ago',
      'nl': '',
    },
    'g6p5kqf4': {
      'en': 'Sent a plan update for ',
      'nl': '',
    },
    'lz32kts6': {
      'en': 'Marketing Plan',
      'nl': '',
    },
    '4r40xqx3': {
      'en': 'Project Started',
      'nl': '',
    },
    'pileshms': {
      'en': '12d ago',
      'nl': '',
    },
    'usyx1bu1': {
      'en': 'CultureWise',
      'nl': '',
    },
    'qho8e9n6': {
      'en': 'Dashboard',
      'nl': '',
    },
    'vgxibxo2': {
      'en': 'Guru Chat',
      'nl': '',
    },
    '7s2bs2wm': {
      'en': 'MarketYou',
      'nl': '',
    },
    '20b0rofw': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'vf3d1qk8': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'sqy8v5ja': {
      'en': 'Courses & Events',
      'nl': '',
    },
    '3s64uhtw': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'slvg6uwf': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'ym4cv9lg': {
      'en': 'Settings',
      'nl': '',
    },
    '9gn8g56j': {
      'en': 'Home',
      'nl': '',
    },
  },
  // homePage2
  {
    'nhcvwd3e': {
      'en': 'Dashboard',
      'nl': '',
    },
    'ba4814ed': {
      'en': 'CultureWise',
      'nl': '',
    },
    's8s9pyj9': {
      'en': 'Dashboard',
      'nl': '',
    },
    'wdmn6vlz': {
      'en': 'Guru Chat',
      'nl': '',
    },
    '8pe04ccy': {
      'en': 'MarketYou',
      'nl': '',
    },
    'gjf27izb': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'z9ll1eo8': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'nnbvu7bh': {
      'en': 'Courses & Events',
      'nl': '',
    },
    't10cr2n7': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'rs42ykx1': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'woz92unf': {
      'en': 'Settings',
      'nl': '',
    },
    '2oond3y7': {
      'en': 'Below is a summary of your teams activity.',
      'nl': '',
    },
    'ckjumne2': {
      'en': 'New Customers',
      'nl': '',
    },
    '16m8g78q': {
      'en': '24',
      'nl': '',
    },
    'wvf9tgea': {
      'en': 'New Contracts',
      'nl': '',
    },
    'zq1xjrk3': {
      'en': '3,200',
      'nl': '',
    },
    'nqmh15zh': {
      'en': 'Projects',
      'nl': '',
    },
    'c9eo6048': {
      'en': 'UI Design Team',
      'nl': '',
    },
    'xagytms2': {
      'en': '4 Members',
      'nl': '',
    },
    'qforoyn8': {
      'en': 'Contract Activity',
      'nl': '',
    },
    'rzwis2o3': {
      'en': 'Below is an a summary of activity.',
      'nl': '',
    },
    'u26z8mt2': {
      'en': 'Device Management',
      'nl': '',
    },
    'y8e2rj27': {
      'en': 'Below is an a summary of activity.',
      'nl': '',
    },
    'dqi022pz': {
      'en': 'Take Quiz',
      'nl': '',
    },
    '3590vv30': {
      'en': '__',
      'nl': '',
    },
  },
  // homePage3
  {
    'yql1axtt': {
      'en': 'Overview',
      'nl': '',
    },
    '58j1q8zi': {
      'en': 'Below is a company overview',
      'nl': '',
    },
    '2w87my43': {
      'en': 'Andrew D.',
      'nl': '',
    },
    'edkduj91': {
      'en': 'admin@gmail.com',
      'nl': '',
    },
    '6r9ce8ge': {
      'en': 'Income this Month',
      'nl': '',
    },
    '9v1i9ato': {
      'en': '\$567,402',
      'nl': '',
    },
    'gstn6abf': {
      'en': 'Total Orders',
      'nl': '',
    },
    'a2i5rdim': {
      'en': '2,208',
      'nl': '',
    },
    'kikgagfv': {
      'en': 'Total Orders',
      'nl': '',
    },
    'g71zlgvy': {
      'en': '2,208',
      'nl': '',
    },
    'c11559gd': {
      'en': 'Total Orders',
      'nl': '',
    },
    's58j7kdi': {
      'en': '2,208',
      'nl': '',
    },
    '1ptegdfa': {
      'en': 'Outstanding Balance',
      'nl': '',
    },
    'xbz9eafr': {
      'en': '\$529,204',
      'nl': '',
    },
    'kvieucvg': {
      'en': '55%',
      'nl': '',
    },
    'oxozsepl': {
      'en': 'Outstanding Balance',
      'nl': '',
    },
    '2yqtm9gc': {
      'en': '\$529,204',
      'nl': '',
    },
    'rc5xwef8': {
      'en': '55%',
      'nl': '',
    },
    '0q2pfkxt': {
      'en': 'Network Requests',
      'nl': '',
    },
    '7svbu42y': {
      'en': 'You’re using 80% of available requests.',
      'nl': '',
    },
    'rv4ox3nw': {
      'en': '562k',
      'nl': '',
    },
    '210gxczk': {
      'en': 'You’ve almost reached your limit',
      'nl': '',
    },
    'racmr2ez': {
      'en':
          'You have used 80% of your available requests. Upgrade plan to make more network requests.',
      'nl': '',
    },
    'ko0ku48q': {
      'en': 'Card Header',
      'nl': '',
    },
    'ar1fc6kb': {
      'en': 'Create tables and ui elements that work below.',
      'nl': '',
    },
    'ydydsrcs': {
      'en': 'Add New',
      'nl': '',
    },
    'l6o3my7e': {
      'en': 'Work Type',
      'nl': '',
    },
    'kxedmxui': {
      'en': 'Assigned User',
      'nl': '',
    },
    'yd31hjod': {
      'en': 'Contract Amount',
      'nl': '',
    },
    'f3lv4fxs': {
      'en': 'Status',
      'nl': '',
    },
    'xmchzwgo': {
      'en': 'Actions',
      'nl': '',
    },
    'ui7m4zuo': {
      'en': 'Design Work',
      'nl': '',
    },
    '9179jlyh': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'r5yrxned': {
      'en': 'Business Name',
      'nl': '',
    },
    '6zcnatt6': {
      'en': '\$2,100',
      'nl': '',
    },
    'pbjxsvjn': {
      'en': 'Paid',
      'nl': '',
    },
    'qncrhjmx': {
      'en': 'Design Work',
      'nl': '',
    },
    '66cbuxa4': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '2peasx13': {
      'en': 'Business Name',
      'nl': '',
    },
    'pemypvse': {
      'en': '\$2,100',
      'nl': '',
    },
    'dyzw4j2v': {
      'en': 'Paid',
      'nl': '',
    },
    '65tbgasx': {
      'en': 'Design Work',
      'nl': '',
    },
    '4m2rz0rh': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'umwkbvge': {
      'en': 'Business Name',
      'nl': '',
    },
    'ncznn7qp': {
      'en': '\$2,100',
      'nl': '',
    },
    '6txv8k9p': {
      'en': 'Paid',
      'nl': '',
    },
    'cpyj3a13': {
      'en': 'Design Work',
      'nl': '',
    },
    'ybnonw57': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'pqz1t1ks': {
      'en': 'Business Name',
      'nl': '',
    },
    'dpj1zuio': {
      'en': '\$2,100',
      'nl': '',
    },
    'tlxjjhas': {
      'en': 'Paid',
      'nl': '',
    },
    'ga10ao5f': {
      'en': 'Design Work',
      'nl': '',
    },
    'as0c5wds': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'rg4pn2ro': {
      'en': 'Business Name',
      'nl': '',
    },
    'mmmn8uao': {
      'en': '\$2,100',
      'nl': '',
    },
    '2s73nq0e': {
      'en': 'Pending',
      'nl': '',
    },
    '6so8n903': {
      'en': 'Design Work',
      'nl': '',
    },
    'cfotscu5': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'grfspct8': {
      'en': 'Business Name',
      'nl': '',
    },
    'whpt7hl1': {
      'en': '\$2,100',
      'nl': '',
    },
    'euyu1zc4': {
      'en': 'Pending',
      'nl': '',
    },
    'xc3khmae': {
      'en': 'Design Work',
      'nl': '',
    },
    'v6acq2vs': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '4p3b332t': {
      'en': 'Business Name',
      'nl': '',
    },
    '1048inli': {
      'en': '\$2,100',
      'nl': '',
    },
    'q68nl1i1': {
      'en': 'Pending',
      'nl': '',
    },
    '81mcfiea': {
      'en': 'Card Header',
      'nl': '',
    },
    '10qap9iw': {
      'en': 'Create tables and ui elements that work below.',
      'nl': '',
    },
    'jtb5ai80': {
      'en': 'Add New',
      'nl': '',
    },
    'w9uys3hz': {
      'en': 'Work Type',
      'nl': '',
    },
    'tihs6kz8': {
      'en': 'Assigned User',
      'nl': '',
    },
    'v1ugdhri': {
      'en': 'Contract Amount',
      'nl': '',
    },
    's1qjgqq5': {
      'en': 'Status',
      'nl': '',
    },
    'bd7jcn14': {
      'en': 'Actions',
      'nl': '',
    },
    'tnnp5bi8': {
      'en': 'Design Work',
      'nl': '',
    },
    'kshscisl': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'n3z2wzl7': {
      'en': 'Business Name',
      'nl': '',
    },
    '7a8mw63q': {
      'en': '\$2,100',
      'nl': '',
    },
    'xuqfk9pu': {
      'en': 'Paid',
      'nl': '',
    },
    'jpz75zwx': {
      'en': 'Design Work',
      'nl': '',
    },
    'syfrgaq7': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'ahn78sa5': {
      'en': 'Business Name',
      'nl': '',
    },
    'ito7mxyv': {
      'en': '\$2,100',
      'nl': '',
    },
    'c6qpy8c2': {
      'en': 'Paid',
      'nl': '',
    },
    'a8uolqpe': {
      'en': 'Design Work',
      'nl': '',
    },
    'o7unkp20': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '0zuh0p36': {
      'en': 'Business Name',
      'nl': '',
    },
    'vb11yj79': {
      'en': '\$2,100',
      'nl': '',
    },
    'yl65olfl': {
      'en': 'Paid',
      'nl': '',
    },
    'bc3qaipo': {
      'en': 'Design Work',
      'nl': '',
    },
    'az24y4wz': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'e5m9b49j': {
      'en': 'Business Name',
      'nl': '',
    },
    '6czt4nfl': {
      'en': '\$2,100',
      'nl': '',
    },
    'xqfo1e4j': {
      'en': 'Paid',
      'nl': '',
    },
    'y3rq5jjb': {
      'en': 'Design Work',
      'nl': '',
    },
    '6lbzkqr4': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'y1hlzsyz': {
      'en': 'Business Name',
      'nl': '',
    },
    'x7aklacc': {
      'en': '\$2,100',
      'nl': '',
    },
    'vg93vcxy': {
      'en': 'Pending',
      'nl': '',
    },
    '6a8abhcc': {
      'en': 'Design Work',
      'nl': '',
    },
    'x0s3b15l': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    't63s5h1v': {
      'en': 'Business Name',
      'nl': '',
    },
    'rs8unktt': {
      'en': '\$2,100',
      'nl': '',
    },
    'f1lchs01': {
      'en': 'Pending',
      'nl': '',
    },
    'gf3s6cub': {
      'en': 'Design Work',
      'nl': '',
    },
    '9azsfs1c': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '7rga45qo': {
      'en': 'Business Name',
      'nl': '',
    },
    '895p15l5': {
      'en': '\$2,100',
      'nl': '',
    },
    'd9tesvur': {
      'en': 'Pending',
      'nl': '',
    },
    'z26witvp': {
      'en': 'CultureWise',
      'nl': '',
    },
    '90s44vgr': {
      'en': 'Dashboard',
      'nl': '',
    },
    'avnyr8wt': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'penngzec': {
      'en': 'MarketYou',
      'nl': '',
    },
    'c3z8w7bq': {
      'en': 'Deep Insights',
      'nl': '',
    },
    '2s5i1wr2': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'bx4dlt0k': {
      'en': 'Courses & Events',
      'nl': '',
    },
    'nhln5f6w': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'o5qdlvrq': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    '7x59c0k5': {
      'en': 'Settings',
      'nl': '',
    },
    'hegl1n5w': {
      'en': 'Home',
      'nl': '',
    },
  },
  // homePage4
  {
    'oeonlvo4': {
      'en': 'Below is a summary of your day.',
      'nl': '',
    },
    '3n6l03u7': {
      'en': '16',
      'nl': '',
    },
    'i1otmkb8': {
      'en': 'New Activity',
      'nl': '',
    },
    'zm2mlbom': {
      'en': '16',
      'nl': '',
    },
    'gebnp7ii': {
      'en': 'Current Tasks',
      'nl': '',
    },
    'nyewx6yh': {
      'en': '16',
      'nl': '',
    },
    '1k3kdl8m': {
      'en': 'Completed Tasks',
      'nl': '',
    },
    '09t9h23e': {
      'en': 'Current Route',
      'nl': '',
    },
    'ndt2u5le': {
      'en': 'An overview of your route.',
      'nl': '',
    },
    'kevy27u5': {
      'en': '15/26',
      'nl': '',
    },
    'g6wua3qe': {
      'en': 'Route progress',
      'nl': '',
    },
    'qg37e8d9': {
      'en': '12',
      'nl': '',
    },
    'mjd9ooi1': {
      'en': 'Tasks to be completed',
      'nl': '',
    },
    'zvz380rj': {
      'en': 'Current Tasks',
      'nl': '',
    },
    'fkz5bjyu': {
      'en': 'A summary of your tasks',
      'nl': '',
    },
    '700aetq0': {
      'en': 'Task Type',
      'nl': '',
    },
    'dzoxdxlp': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'nl': '',
    },
    'vws7zmba': {
      'en': 'Due:',
      'nl': '',
    },
    '69p6yvir': {
      'en': 'Today, 6:20pm',
      'nl': '',
    },
    'jvqfjo1q': {
      'en': 'Update',
      'nl': '',
    },
    'poj8ggbr': {
      'en': '1',
      'nl': '',
    },
    'o32cazzv': {
      'en': 'Task Type',
      'nl': '',
    },
    'vwj0hk6u': {
      'en': 'Task description here.',
      'nl': '',
    },
    'jqo6unar': {
      'en': 'Due:',
      'nl': '',
    },
    'w92v0u8s': {
      'en': 'Today, 6:20pm',
      'nl': '',
    },
    '73qoqmr7': {
      'en': 'Update',
      'nl': '',
    },
    'zk1g1lml': {
      'en': '1',
      'nl': '',
    },
    '14hhgt83': {
      'en': 'Recent Activity',
      'nl': '',
    },
    '37cr8u3j': {
      'en': 'Below is an overview of tasks & activity completed.',
      'nl': '',
    },
    '3flblaas': {
      'en': 'Tasks',
      'nl': '',
    },
    'owxq4884': {
      'en': 'Completed',
      'nl': '',
    },
    'y0e8qg80': {
      'en': 'Launches',
      'nl': '',
    },
    'e8xtd9dh': {
      'en': 'Last 30 Days',
      'nl': '',
    },
    'siape6w3': {
      'en': 'Avg. Grade',
      'nl': '',
    },
    'muik9152': {
      'en': 'Dashboard',
      'nl': '',
    },
    'x9flqc0n': {
      'en': 'CultureWise',
      'nl': '',
    },
    'cv6rrfjh': {
      'en': 'Dashboard',
      'nl': '',
    },
    'w2q3xbnq': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'bjyc2nlf': {
      'en': 'MarketYou',
      'nl': '',
    },
    'h2djslgj': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'ho54caas': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'k8viossv': {
      'en': 'Courses & Events',
      'nl': '',
    },
    'chyuc3my': {
      'en': 'Scoreboard',
      'nl': '',
    },
    '93adl4vt': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    '496u9a1c': {
      'en': 'Settings',
      'nl': '',
    },
    'ycehqv5q': {
      'en': 'Home',
      'nl': '',
    },
  },
  // homePage5
  {
    '26sgjjp7': {
      'en': 'Overview',
      'nl': '',
    },
    'mw2v09rl': {
      'en': 'Below is a company overview',
      'nl': '',
    },
    'n0xf5czd': {
      'en': 'Andrew D.',
      'nl': '',
    },
    'oiwm27vj': {
      'en': 'admin@gmail.com',
      'nl': '',
    },
    '2j6o17xd': {
      'en': 'Income this Month',
      'nl': '',
    },
    '5wwif2se': {
      'en': '\$567,402',
      'nl': '',
    },
    'vqb5jjdp': {
      'en': 'Total Orders',
      'nl': '',
    },
    'aa1vesxc': {
      'en': '2,208',
      'nl': '',
    },
    'voj41rpa': {
      'en': 'Total Orders',
      'nl': '',
    },
    'f3ngpl9w': {
      'en': '2,208',
      'nl': '',
    },
    'opem3siw': {
      'en': 'Total Orders',
      'nl': '',
    },
    '02kg8wvj': {
      'en': '2,208',
      'nl': '',
    },
    '4ow4icxh': {
      'en': 'Account Overview',
      'nl': '',
    },
    'ylnf0phb': {
      'en': 'Your Balance',
      'nl': '',
    },
    '7922rlx7': {
      'en': '\$6,424.20',
      'nl': '',
    },
    'bnlg5nqb': {
      'en': 'Transfer Balance',
      'nl': '',
    },
    '6ya41ks8': {
      'en': 'Monthly Goal',
      'nl': '',
    },
    'xkar1mz4': {
      'en': '62.2% /',
      'nl': '',
    },
    '0aof4ab9': {
      'en': ' \$12,000',
      'nl': '',
    },
    '88p1q8z5': {
      'en': 'Forecasted income is: ',
      'nl': '',
    },
    '0rjomtyx': {
      'en': '\$3,502',
      'nl': '',
    },
    'xt7jd51d': {
      'en': 'Edit',
      'nl': '',
    },
    'kyscpahf': {
      'en': 'Top Friends',
      'nl': '',
    },
    '0z9f3fqd': {
      'en': 'Rudy Fernandez',
      'nl': '',
    },
    '1suzhvpe': {
      'en': 'Manager',
      'nl': '',
    },
    'aa2so1sh': {
      'en': 'Abigail Herrara',
      'nl': '',
    },
    'qqdjppkx': {
      'en': 'Designer',
      'nl': '',
    },
    'zcrfb57q': {
      'en': 'Liz Ambridge',
      'nl': '',
    },
    'i8canc7x': {
      'en': 'Manager',
      'nl': '',
    },
    'u89bi8ot': {
      'en': 'Liz Rogers',
      'nl': '',
    },
    'x8ntqmsk': {
      'en': 'Front End Dev',
      'nl': '',
    },
    '7uv41ytb': {
      'en': 'Outstanding Balance',
      'nl': '',
    },
    'vragctyx': {
      'en': '\$529,204',
      'nl': '',
    },
    'ydw5r7x6': {
      'en': '55%',
      'nl': '',
    },
    'lh56zmwu': {
      'en': 'Budget Overview',
      'nl': '',
    },
    '8gatkyyn': {
      'en': '\$242,102',
      'nl': '',
    },
    'tbziqzb0': {
      'en': '25%',
      'nl': '',
    },
    '6r2how7y': {
      'en': 'Outstanding Invoices',
      'nl': '',
    },
    'o694qmme': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'nl': '',
    },
    '6ynl0nql': {
      'en': 'Add New',
      'nl': '',
    },
    'mikhrkgo': {
      'en': 'Work Type',
      'nl': '',
    },
    'jwddr0h5': {
      'en': 'Sent To:',
      'nl': '',
    },
    '4owi5nze': {
      'en': 'Contract Amount',
      'nl': '',
    },
    'mi29v0ak': {
      'en': 'Status',
      'nl': '',
    },
    'v3how01x': {
      'en': 'Actions',
      'nl': '',
    },
    'arci7dpz': {
      'en': 'Design Work',
      'nl': '',
    },
    'f8rz1h9n': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'a22uuumj': {
      'en': 'Business Name',
      'nl': '',
    },
    'y6i4dz9y': {
      'en': '\$2,100',
      'nl': '',
    },
    '0zsbfiko': {
      'en': 'Paid',
      'nl': '',
    },
    '98h6nrki': {
      'en': 'Design Work',
      'nl': '',
    },
    'kpknexaq': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'beqjudw5': {
      'en': 'Business Name',
      'nl': '',
    },
    'u45sodq5': {
      'en': '\$2,100',
      'nl': '',
    },
    's0boqj92': {
      'en': 'Paid',
      'nl': '',
    },
    'xbv5cihj': {
      'en': 'Design Work',
      'nl': '',
    },
    'nsg2fb0a': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'qij45qyf': {
      'en': 'Business Name',
      'nl': '',
    },
    '373hv3bc': {
      'en': '\$2,100',
      'nl': '',
    },
    'c57uzef1': {
      'en': 'Paid',
      'nl': '',
    },
    'nbkwu2q8': {
      'en': 'Design Work',
      'nl': '',
    },
    'ahf9orwp': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'jdnngj36': {
      'en': 'Business Name',
      'nl': '',
    },
    'nqwuoyyl': {
      'en': '\$2,100',
      'nl': '',
    },
    'xu6xkt03': {
      'en': 'Paid',
      'nl': '',
    },
    'lvk24m15': {
      'en': 'Design Work',
      'nl': '',
    },
    'wc3jomnq': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'w0ounzso': {
      'en': 'Business Name',
      'nl': '',
    },
    'd7r7i8km': {
      'en': '\$2,100',
      'nl': '',
    },
    'hr0qlqt9': {
      'en': 'Pending',
      'nl': '',
    },
    'lurvqvtg': {
      'en': 'Design Work',
      'nl': '',
    },
    'yoy6c821': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'h1v1nbu0': {
      'en': 'Business Name',
      'nl': '',
    },
    '45qgagcf': {
      'en': '\$2,100',
      'nl': '',
    },
    'b0dzgeas': {
      'en': 'Pending',
      'nl': '',
    },
    '1wbi950j': {
      'en': 'Design Work',
      'nl': '',
    },
    '1vp8pbqh': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'hcyf8dvc': {
      'en': 'Business Name',
      'nl': '',
    },
    '9h7oiyxb': {
      'en': '\$2,100',
      'nl': '',
    },
    '4077khrs': {
      'en': 'Pending',
      'nl': '',
    },
    '54lw9a9l': {
      'en': 'Card Header',
      'nl': '',
    },
    'hvcx5yao': {
      'en': 'Create tables and ui elements that work below.',
      'nl': '',
    },
    'x1h509j3': {
      'en': 'Add New',
      'nl': '',
    },
    '8vp5qede': {
      'en': 'Work Type',
      'nl': '',
    },
    '2tdruk3v': {
      'en': 'Assigned User',
      'nl': '',
    },
    'c83yy40e': {
      'en': 'Contract Amount',
      'nl': '',
    },
    'ofrcx1yv': {
      'en': 'Status',
      'nl': '',
    },
    '00wztti3': {
      'en': 'Actions',
      'nl': '',
    },
    '1xqlf7g4': {
      'en': 'Design Work',
      'nl': '',
    },
    'br3lhd7q': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'nl2epbli': {
      'en': 'Business Name',
      'nl': '',
    },
    'dl1m00b0': {
      'en': '\$2,100',
      'nl': '',
    },
    'u2scrsxy': {
      'en': 'Paid',
      'nl': '',
    },
    '58txnpk5': {
      'en': 'Design Work',
      'nl': '',
    },
    'snc7z6l4': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '7opj2zuw': {
      'en': 'Business Name',
      'nl': '',
    },
    'z7q3n4a1': {
      'en': '\$2,100',
      'nl': '',
    },
    '797rdje4': {
      'en': 'Paid',
      'nl': '',
    },
    'toa7gyuc': {
      'en': 'Design Work',
      'nl': '',
    },
    'fy4lpnu3': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'xqm2s1jw': {
      'en': 'Business Name',
      'nl': '',
    },
    'pdwp7iw9': {
      'en': '\$2,100',
      'nl': '',
    },
    'pbbw5k9j': {
      'en': 'Paid',
      'nl': '',
    },
    'e9v5p4xj': {
      'en': 'Design Work',
      'nl': '',
    },
    'mynaeieb': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'pw9z72aq': {
      'en': 'Business Name',
      'nl': '',
    },
    'ns0hq7b9': {
      'en': '\$2,100',
      'nl': '',
    },
    'o1uz4vry': {
      'en': 'Paid',
      'nl': '',
    },
    'jmquqk4f': {
      'en': 'Design Work',
      'nl': '',
    },
    'j0eb005a': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'dwqzvqml': {
      'en': 'Business Name',
      'nl': '',
    },
    'a0xmbqu2': {
      'en': '\$2,100',
      'nl': '',
    },
    'jadz5xha': {
      'en': 'Pending',
      'nl': '',
    },
    'fzkwusny': {
      'en': 'Design Work',
      'nl': '',
    },
    'do8vhpmi': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    'pzc3skvx': {
      'en': 'Business Name',
      'nl': '',
    },
    'jt0a5ikc': {
      'en': '\$2,100',
      'nl': '',
    },
    'ax2tv0bg': {
      'en': 'Pending',
      'nl': '',
    },
    'o01kpju0': {
      'en': 'Design Work',
      'nl': '',
    },
    '55vvo3c9': {
      'en': 'Randy Peterson',
      'nl': '',
    },
    '6n30bi2s': {
      'en': 'Business Name',
      'nl': '',
    },
    'pp6c48s2': {
      'en': '\$2,100',
      'nl': '',
    },
    'cp1fp9hk': {
      'en': 'Pending',
      'nl': '',
    },
    'wfqqbdpi': {
      'en': 'CultureWise',
      'nl': '',
    },
    'm224aakf': {
      'en': 'Dashboard',
      'nl': '',
    },
    'kjb4lpof': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'iq54u4o3': {
      'en': 'MarketYou',
      'nl': '',
    },
    'exji4t32': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'kgtj8ulm': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'ta3qolby': {
      'en': 'Courses & Events',
      'nl': '',
    },
    '6h2xikn5': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'ivrpnh04': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'ma3n6xwl': {
      'en': 'Settings',
      'nl': '',
    },
    'wrdfs8p5': {
      'en': 'Home',
      'nl': '',
    },
  },
  // Details05Event
  {
    '3ti68de7': {
      'en': 'Ocean Viability',
      'nl': '',
    },
    'w6okkp06': {
      'en': '12:30pm',
      'nl': '',
    },
    'g1vm36lf': {
      'en': 'Main  Center Stage',
      'nl': '',
    },
    'emmbkw4i': {
      'en':
          'By protecting and preserving our oceans, we can effectively reduce global warming as healthy...',
      'nl': '',
    },
    'ph6b023q': {
      'en':
          'By protecting and preserving our oceans, we can effectively reduce global warming as healthy oceans absorb a significant amount of atmospheric carbon dioxide. Implementing measures to prevent overfishing, reducing plastic pollution, and conserving marine habitats will contribute to a balanced ocean ecosystem, ultimately mitigating global warming.',
      'nl': '',
    },
    '0jt1wbuh': {
      'en': 'Featured Speakers',
      'nl': '',
    },
    '3f4xuzuq': {
      'en': 'Address',
      'nl': '',
    },
    'dm62kkey': {
      'en': '420 Magnificant Ocean Way',
      'nl': '',
    },
    'udlf5oeq': {
      'en': 'San Diego, CA 91911',
      'nl': '',
    },
    'wbqp7nja': {
      'en': 'Get Tickets',
      'nl': '',
    },
    'g0evxz66': {
      'en': 'View in Map',
      'nl': '',
    },
    'uo3ql3nl': {
      'en': 'Home',
      'nl': '',
    },
  },
  // eventListPage
  {
    'ku32ubsw': {
      'en': 'Homes',
      'nl': '',
    },
    'sxaoiaqm': {
      'en': 'Maidstone, San Antonio, Tx.',
      'nl': '',
    },
    '7tfjw41w': {
      'en': '\$210/night',
      'nl': '',
    },
    'o9v85c96': {
      'en': '32 miles away',
      'nl': '',
    },
    'qxvsatn4': {
      'en': '4.25',
      'nl': '',
    },
    '19yunl76': {
      'en': 'Maidstone, San Antonio, Tx.',
      'nl': '',
    },
    'izb0go7p': {
      'en': '\$210/night',
      'nl': '',
    },
    'qp1blz3p': {
      'en': '32 miles away',
      'nl': '',
    },
    '3xajpjvh': {
      'en': '4.25',
      'nl': '',
    },
    'm18tbrxe': {
      'en': 'Beachfront',
      'nl': '',
    },
    '1zyyys5p': {
      'en': 'Maidstone, San Antonio, Tx.',
      'nl': '',
    },
    'ei8f9wq3': {
      'en': '\$210/night',
      'nl': '',
    },
    'nhm1kn6b': {
      'en': '32 miles away',
      'nl': '',
    },
    'aamhgq0b': {
      'en': '4.25',
      'nl': '',
    },
    'm4jeuilu': {
      'en': 'Maidstone, San Antonio, Tx.',
      'nl': '',
    },
    '1ggm5rz3': {
      'en': '\$210/night',
      'nl': '',
    },
    'ee1dhgmv': {
      'en': '32 miles away',
      'nl': '',
    },
    '833nx40a': {
      'en': '4.25',
      'nl': '',
    },
    'zmts7oks': {
      'en': 'Nature',
      'nl': '',
    },
    'v57vw14f': {
      'en': 'Maidstone, San Antonio, Tx.',
      'nl': '',
    },
    'oqiwghp4': {
      'en': '\$210/night',
      'nl': '',
    },
    'opfe2qb5': {
      'en': '32 miles away',
      'nl': '',
    },
    '076sfzaw': {
      'en': '4.25',
      'nl': '',
    },
    'mji03av1': {
      'en': 'Maidstone, San Antonio, Tx.',
      'nl': '',
    },
    'c9e4kmza': {
      'en': '\$210/night',
      'nl': '',
    },
    '8z511oi7': {
      'en': '32 miles away',
      'nl': '',
    },
    'kxl1loy4': {
      'en': '4.25',
      'nl': '',
    },
    '2dlyc6zn': {
      'en': 'CultureWise',
      'nl': '',
    },
    'ms638szt': {
      'en': 'Dashboard',
      'nl': '',
    },
    'x9pirc73': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'lwqib4zq': {
      'en': 'MarketYou',
      'nl': '',
    },
    'c2srgbok': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'asnif8rn': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'o9k1xdgg': {
      'en': 'Courses & Events',
      'nl': '',
    },
    'nzns1c3t': {
      'en': 'Scoreboard',
      'nl': '',
    },
    '3jtmzkaw': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'mehfon0v': {
      'en': 'Settings',
      'nl': '',
    },
    'gmezlbq0': {
      'en': 'Home',
      'nl': '',
    },
  },
  // coursePage
  {
    '6im54i3q': {
      'en': 'Class Details',
      'nl': '',
    },
    'uk13kpz5': {
      'en': 'Class Name',
      'nl': '',
    },
    'et06mwf5': {
      'en': '10:00am',
      'nl': '',
    },
    'xcm66dtt': {
      'en':
          'The best of all 3 worlds, Row & Flow offers high intensity rowing and strength intervals followed by athletic based yoga sure to enhance flexible and clear the mind. Yoga mats are provided but bringing your own yoga mat is highly encouraged.',
      'nl': '',
    },
    'oy5ehuqb': {
      'en': '30m | High Intensity | Indoor/Outdoor',
      'nl': '',
    },
    '56kt87rh': {
      'en': 'Kye S',
      'nl': '',
    },
    'lhjmnikk': {
      'en': 'Kye S',
      'nl': '',
    },
    '41n5coi3': {
      'en': 'Kye S',
      'nl': '',
    },
    'xjgxz2dh': {
      'en': 'Kye S',
      'nl': '',
    },
    'ztvd1ap0': {
      'en': 'Reserve Spot',
      'nl': '',
    },
  },
  // socialMediaPostPage
  {
    '65tv6blk': {
      'en': 'Activity',
      'nl': '',
    },
    'uvxvqtkl': {
      'en': 'Bio',
      'nl': '',
    },
    '6k8jpayr': {
      'en':
          'I exist to design pixels, beyond that my life is void and meaningless... i\'m just kidding I live to make other peoples lives easier.',
      'nl': '',
    },
    'e69g0eln': {
      'en': '152',
      'nl': '',
    },
    'gsvmgj5h': {
      'en': 'Trips',
      'nl': '',
    },
    '6bjcbyxb': {
      'en': '24k',
      'nl': '',
    },
    'pxpzd6ct': {
      'en': 'Points',
      'nl': '',
    },
    'umggvmol': {
      'en': '240',
      'nl': '',
    },
    'isrpl5hx': {
      'en': 'Friends',
      'nl': '',
    },
    'ufrwcf9h': {
      'en': 'Social Posts',
      'nl': '',
    },
    'ur7k6400': {
      'en': 'Andrew Daniels',
      'nl': '',
    },
    'l0q7dmkm': {
      'en': '@username',
      'nl': '',
    },
    'hiovk94h': {
      'en': ' • ',
      'nl': '',
    },
    'tk2ffvtc': {
      'en': '4 mins ago',
      'nl': '',
    },
    'dnrf0ij2': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'nl': '',
    },
    'vq3o7wr9': {
      'en': '4',
      'nl': '',
    },
    'jfwpjilq': {
      'en': '4',
      'nl': '',
    },
    'kw6ehxci': {
      'en': 'Andrew Daniels',
      'nl': '',
    },
    '4fvfedqk': {
      'en': '@username',
      'nl': '',
    },
    '38f4awz8': {
      'en': ' • ',
      'nl': '',
    },
    'grcje0ns': {
      'en': '4 mins ago',
      'nl': '',
    },
    'd5w7uvk4': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,',
      'nl': '',
    },
    'auk543d0': {
      'en': '4',
      'nl': '',
    },
    'yv1705r8': {
      'en': '4',
      'nl': '',
    },
    'fio5oafe': {
      'en': 'CultureWise',
      'nl': '',
    },
    'qyc9i4mk': {
      'en': 'Dashboard',
      'nl': '',
    },
    '17rqy1r0': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'lm549lt1': {
      'en': 'MarketYou',
      'nl': '',
    },
    '3txjdx4r': {
      'en': 'Deep Insights',
      'nl': '',
    },
    '2o6smiyi': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'h677hkg7': {
      'en': 'Courses & Events',
      'nl': '',
    },
    'zti2pnrn': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'r0e0ahom': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'jste7fx7': {
      'en': 'Settings',
      'nl': '',
    },
    '4lz6c1yg': {
      'en': 'Home',
      'nl': '',
    },
  },
  // createSocialPostPage
  {
    '5ecxy2lg': {
      'en': 'Send',
      'nl': '',
    },
    '6criznqz': {
      'en': 'Cancel',
      'nl': '',
    },
    'spt5xdfa': {
      'en': 'Andres Franchellis',
      'nl': '',
    },
    'uhxxn8uq': {
      'en': '@andresfrans',
      'nl': '',
    },
    'svspcggc': {
      'en': 'What\'s happening?',
      'nl': '',
    },
    '2yggl3ua': {
      'en': 'CultureWise',
      'nl': '',
    },
    'ud2vqgc4': {
      'en': 'Dashboard',
      'nl': '',
    },
    '56xfptn7': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'd6j562lk': {
      'en': 'MarketYou',
      'nl': '',
    },
    'hzbhtxng': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'ejfj7cb6': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'luz8chuw': {
      'en': 'Courses & Events',
      'nl': '',
    },
    'ylr5c8gd': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'cn1so2ds': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    '60czlp8y': {
      'en': 'Settings',
      'nl': '',
    },
    '0oklaj8r': {
      'en': 'Home',
      'nl': '',
    },
  },
  // yearWrapupPage
  {
    'h3cd86py': {
      'en': '24k',
      'nl': '',
    },
    'irqnwel1': {
      'en': 'Followers',
      'nl': '',
    },
    'n42ubk6h': {
      'en': '152',
      'nl': '',
    },
    'y7f5dmbu': {
      'en': 'Following',
      'nl': '',
    },
    'rth4bnls': {
      'en':
          'I exist to design pixels, beyond that my life is void and meaningless... i\'m just kidding I live to make other peoples lives easier.',
      'nl': '',
    },
    'q6pihltu': {
      'en': 'My Stats',
      'nl': '',
    },
    '0qmxpt6c': {
      'en': '56.4k',
      'nl': '',
    },
    'decwbq47': {
      'en': 'Customers',
      'nl': '',
    },
    'zroaq0zy': {
      'en': '56.4k',
      'nl': '',
    },
    'f2mjwhka': {
      'en': 'Customers',
      'nl': '',
    },
    'uvhlfoia': {
      'en': '56.4k',
      'nl': '',
    },
    'ochhz9oa': {
      'en': 'Customers',
      'nl': '',
    },
    '1bpc71t8': {
      'en': '56.4k',
      'nl': '',
    },
    'tlcmpm79': {
      'en': 'Customers',
      'nl': '',
    },
    '5s33e3c5': {
      'en': 'CultureWise',
      'nl': '',
    },
    '5w3beys4': {
      'en': 'Dashboard',
      'nl': '',
    },
    'eac81xv0': {
      'en': 'Guru Chat',
      'nl': '',
    },
    '5121ii51': {
      'en': 'MarketYou',
      'nl': '',
    },
    'sqwk3nwe': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'f7aa47us': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    '2cr5qc4i': {
      'en': 'Courses & Events',
      'nl': '',
    },
    's9gcao2q': {
      'en': 'Scoreboard',
      'nl': '',
    },
    'q2jprt8b': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'yjd9fk8s': {
      'en': 'Settings',
      'nl': '',
    },
    'qndrpu0v': {
      'en': 'Home',
      'nl': '',
    },
  },
  // Details24QuizPage
  {
    'jh353v4i': {
      'en': 'Question 1/3',
      'nl': '',
    },
    'qg9a7caw': {
      'en': 'How is your mood?',
      'nl': '',
    },
    'rxwhg9ag': {
      'en': 'On a scale of 1 - 3 how are you feeling today?',
      'nl': '',
    },
    'iv8o621z': {
      'en': 'Next Question',
      'nl': '',
    },
    'fn07en6u': {
      'en': 'Daily Quiz',
      'nl': '',
    },
    'vn7u7r4j': {
      'en': 'Home',
      'nl': '',
    },
  },
  // quiz2
  {
    'xkewp1dd': {
      'en': 'Question 2/3',
      'nl': '',
    },
    '9opbqtg4': {
      'en': 'How was your day?',
      'nl': '',
    },
    'gs32y0u3': {
      'en': 'Did you experience anything out of the ordinary?',
      'nl': '',
    },
    'cm7vj35i': {
      'en': 'Incredible  😇',
      'nl': '',
    },
    '1y3xnipm': {
      'en': 'Great 😃',
      'nl': '',
    },
    'aj9saze3': {
      'en': 'Good 🙂',
      'nl': '',
    },
    'bxdus51p': {
      'en': 'Okay 😕',
      'nl': '',
    },
    '2zy835hn': {
      'en': 'Really Bad 😞',
      'nl': '',
    },
    '2mcpf2eb': {
      'en': 'Next Question',
      'nl': '',
    },
    '4iysqu9t': {
      'en': 'Daily Quiz',
      'nl': '',
    },
    'ap6zc46p': {
      'en': 'Home',
      'nl': '',
    },
  },
  // scoreBoardPage
  {
    'zogas78t': {
      'en': 'Scoreboard',
      'nl': '',
    },
    '1jt0luvm': {
      'en': 'Within Organization',
      'nl': '',
    },
    'rll0c5px': {
      'en': 'Points: 100',
      'nl': '',
    },
    'verxfg3v': {
      'en': 'Between Organizations',
      'nl': '',
    },
    '8r2rg748': {
      'en': 'Great Place To Work',
      'nl': '',
    },
    'wbgcp4kj': {
      'en': 'info@greatplacetowork.com',
      'nl': '',
    },
    'btuhhmsn': {
      'en': 'Points: 200',
      'nl': '',
    },
    'aikb4p7l': {
      'en': 'CultureWise',
      'nl': '',
    },
    'q3rrbct7': {
      'en': 'Dashboard',
      'nl': '',
    },
    'hhop7igl': {
      'en': 'Guru Chat',
      'nl': '',
    },
    'wes9zh2g': {
      'en': 'MarketYou',
      'nl': '',
    },
    '9w6zkdiv': {
      'en': 'Deep Insights',
      'nl': '',
    },
    'mwbe3136': {
      'en': 'Skill Development Plan',
      'nl': '',
    },
    'fg7gezm6': {
      'en': 'Courses & Events',
      'nl': '',
    },
    '8qxerdon': {
      'en': 'Scoreboard',
      'nl': '',
    },
    '0y740rv1': {
      'en': 'Year Wrap-Up',
      'nl': '',
    },
    'uzef0r99': {
      'en': 'Settings',
      'nl': '',
    },
  },
  // quiz2Copy
  {
    'nqjsqgcu': {
      'en': 'Question 3/3',
      'nl': '',
    },
    'pqx4b19q': {
      'en': 'How was your day?',
      'nl': '',
    },
    'f76sqxw6': {
      'en': 'Did you experience anything out of the ordinary?',
      'nl': '',
    },
    'pa2gvluh': {
      'en': 'Incredible  😇',
      'nl': '',
    },
    '8cgjvb55': {
      'en': 'Great 😃',
      'nl': '',
    },
    'r0jecl0y': {
      'en': 'Good 🙂',
      'nl': '',
    },
    'g229ep0m': {
      'en': 'Okay 😕',
      'nl': '',
    },
    'b1e8lh9r': {
      'en': 'Really Bad 😞',
      'nl': '',
    },
    'o1m1g3qx': {
      'en': 'Finish Quiz',
      'nl': '',
    },
    '4vvm4np3': {
      'en': 'Daily Quiz',
      'nl': '',
    },
    'bdzyvcij': {
      'en': 'Home',
      'nl': '',
    },
  },
  // emptyList
  {
    'rv46u5l6': {
      'en': 'Ai Chat Active!',
      'nl': '',
    },
    'w70nskny': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'nl': '',
    },
    '1gjyi579': {
      'en': 'https://platform.openai.com',
      'nl': '',
    },
    '1i01gfh5': {
      'en': 'Watch Tutorial',
      'nl': '',
    },
  },
  // aiChat_Component
  {
    'mt698ngo': {
      'en': 'Copy response',
      'nl': '',
    },
    '1jifzmx3': {
      'en': 'Type something...',
      'nl': '',
    },
  },
  // Miscellaneous
  {
    'us9jukft': {
      'en':
          'Please Allow CultureWise To Send You Notifications To Improve Your Leadership Skills!',
      'nl': '',
    },
    'h8qcbuvl': {
      'en': '',
      'nl': '',
    },
    '2y9u5876': {
      'en': '',
      'nl': '',
    },
    '42ok1pbr': {
      'en': '',
      'nl': '',
    },
    'v0blr1zd': {
      'en': '',
      'nl': '',
    },
    '84qsxspk': {
      'en': '',
      'nl': '',
    },
    'ndrv1680': {
      'en': '',
      'nl': '',
    },
    '4jxcvnta': {
      'en': '',
      'nl': '',
    },
    'nbxdyt53': {
      'en': '',
      'nl': '',
    },
    '8zw7dgjh': {
      'en': '',
      'nl': '',
    },
    '0yuzsgo3': {
      'en': '',
      'nl': '',
    },
    '2zc6d35g': {
      'en': '',
      'nl': '',
    },
    'd7tc1kho': {
      'en': '',
      'nl': '',
    },
    'rqzulxyk': {
      'en': '',
      'nl': '',
    },
    'rxpreej9': {
      'en': '',
      'nl': '',
    },
    'k78wmo2k': {
      'en': '',
      'nl': '',
    },
    'sa4qu069': {
      'en': '',
      'nl': '',
    },
    'rqswa3g5': {
      'en': '',
      'nl': '',
    },
    'b6tkqkfa': {
      'en': '',
      'nl': '',
    },
    '8jh2mlke': {
      'en': '',
      'nl': '',
    },
    'eopen4w0': {
      'en': '',
      'nl': '',
    },
    'f4wl1fgb': {
      'en': '',
      'nl': '',
    },
    'k85ebwmp': {
      'en': '',
      'nl': '',
    },
    '8j692t58': {
      'en': '',
      'nl': '',
    },
    '23rpuxz9': {
      'en': '',
      'nl': '',
    },
    'bpnar7di': {
      'en': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
