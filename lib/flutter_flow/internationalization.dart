import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'nl', 'es'];

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
    String? esText = '',
  }) =>
      [enText, nlText, esText][languageIndex] ?? '';

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
      'es': 'Crear una cuenta',
      'nl': 'Account aanmaken',
    },
    'k5g8iekk': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'nl': 'Account aanmaken',
    },
    'on9mdim0': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos completando el formulario a continuación.',
      'nl': 'Laten we beginnen door het onderstaande formulier in te vullen.',
    },
    'pztg21js': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'nl': 'E-mail',
    },
    'gk9r5b3q': {
      'en': 'Password',
      'es': 'Contraseña',
      'nl': 'Wachtwoord',
    },
    'mmuv0qc8': {
      'en': 'Password',
      'es': 'Contraseña',
      'nl': 'Wachtwoord',
    },
    'zydivaji': {
      'en': 'Get Started',
      'es': 'Empezar',
      'nl': 'Begin',
    },
    'c2tqz07j': {
      'en': 'Or sign up with',
      'es': 'O regístrate con',
      'nl': 'Of meld je aan bij',
    },
    'tcoga1xk': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
      'nl': 'Ga verder met Google',
    },
    'as207h5u': {
      'en': 'Log In',
      'es': 'Acceso',
      'nl': 'Log in',
    },
    'i8qumj34': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
      'nl': 'Welkom terug',
    },
    'ypa2brwb': {
      'en': 'Fill out the information below in order to access your account.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
      'nl':
          'Vul onderstaande gegevens in om toegang te krijgen tot uw account.',
    },
    'iyrep1f8': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'nl': 'E-mail',
    },
    'swpdgdg9': {
      'en': 'Password',
      'es': 'Contraseña',
      'nl': 'Wachtwoord',
    },
    '3abaf994': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
      'nl': 'Aanmelden',
    },
    'ny611kq9': {
      'en': 'Or sign in with',
      'es': 'O inicia sesión con',
      'nl': 'Of log in met',
    },
    'n6ttrz5w': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
      'nl': 'Ga verder met Google',
    },
    'ppgre965': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
      'nl': 'Wachtwoord vergeten?',
    },
    '9a7tgqyi': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // settingsPage
  {
    'alkgyufw': {
      'en': 'Account',
      'es': 'Cuenta',
      'nl': 'Rekening',
    },
    'udbpsvzo': {
      'en': 'Integration With GPTW',
      'es': 'Integración con GPTW',
      'nl': 'Integratie met GPTW',
    },
    'tg1yxs4v': {
      'en': 'Payment Options',
      'es': 'Opciones de pago',
      'nl': 'Betalingsmogelijkheden',
    },
    'okc2mw6k': {
      'en': 'Notification Settings',
      'es': 'Configuración de las notificaciones',
      'nl': 'Notificatie instellingen',
    },
    'al24cais': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'nl': 'Bewerk profiel',
    },
    'g2lypz8o': {
      'en': 'General',
      'es': 'General',
      'nl': 'Algemeen',
    },
    '2j72or0r': {
      'en': 'Support',
      'es': 'Apoyo',
      'nl': 'Steun',
    },
    'cmrzgauy': {
      'en': 'Terms of Service',
      'es': 'Términos de servicio',
      'nl': 'Servicevoorwaarden',
    },
    '9qqyhntc': {
      'en': 'Profile',
      'es': 'Perfil',
      'nl': 'Profiel',
    },
    'caiko49f': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // editProfilePage
  {
    'izgji3c3': {
      'en': 'Great Place To Work',
      'es': 'Gran lugar para trabajar',
      'nl': 'Geweldige plek om te werken',
    },
    'x61axz0w': {
      'en': 'Haarlem',
      'es': 'Haarlem',
      'nl': 'Haarlem',
    },
    'tddt4k27': {
      'en': 'Function',
      'es': 'Función',
      'nl': 'Functie',
    },
    'wsydsx4t': {
      'en': 'Function',
      'es': 'Función',
      'nl': 'Functie',
    },
    'b43od2gb': {
      'en': 'CEO',
      'es': 'CEO',
      'nl': 'Directeur',
    },
    '22fh0o5w': {
      'en': 'CTO',
      'es': 'CTO',
      'nl': 'CTO',
    },
    'hrqlaexb': {
      'en': 'CFO',
      'es': 'director de Finanzas',
      'nl': 'financieel directeur',
    },
    'wuyua8b4': {
      'en': 'HR Manager',
      'es': 'Gerente de Recursos Humanos',
      'nl': 'HR Manager',
    },
    'fcvoco3g': {
      'en': 'Innovation Director',
      'es': 'Directora de Innovación',
      'nl': 'Directeur Innovatie',
    },
    'l6nfte3k': {
      'en': 'SelectFunction At Your Company',
      'es': 'Seleccione la función en su empresa',
      'nl': 'SelecteerFunctie Bij Uw Bedrijf',
    },
    'oxts8gx5': {
      'en': 'CEO',
      'es': 'CEO',
      'nl': 'Directeur',
    },
    'wia8cu1v': {
      'en': 'Become a great leader',
      'es': 'Conviértete en un gran líder',
      'nl': 'Word een geweldige leider',
    },
    'entei2hr': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'nl': 'Wijzigingen opslaan',
    },
    'gsnrwewc': {
      'en': 'Edit your Profile',
      'es': 'Edite su perfil',
      'nl': 'Pas je profiel aan',
    },
  },
  // settingsNotificationsPage
  {
    'lc8fjoze': {
      'en': 'Settings Page',
      'es': 'Página de configuración',
      'nl': 'Instellingenpagina',
    },
    '1r3bc48j': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
      'nl':
          'Kies hieronder welke meldingen je wilt ontvangen, dan passen wij de instellingen aan.',
    },
    '5xyl4b1r': {
      'en': 'Push Notifications',
      'es': 'Notificaciones push',
      'nl': 'Pushmeldingen',
    },
    'mo5q98ku': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'es':
          'Reciba notificaciones push de nuestra aplicación de forma semiregular.',
      'nl': 'Ontvang semi-regelmatig pushmeldingen van onze applicatie.',
    },
    'e4x0xmpz': {
      'en': 'Email Notifications',
      'es': 'Notificaciónes de Correo Electrónico',
      'nl': 'E-mail notificaties',
    },
    'zwmnzsnr': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
      'nl':
          'Ontvang e-mailmeldingen van ons marketingteam over nieuwe functies.',
    },
    'cfi5flwv': {
      'en': 'Location Services',
      'es': 'Servicios de localización',
      'nl': 'Locatiediensten',
    },
    'tac1n0lp': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de sus gastos y lo mantiene seguro.',
      'nl':
          'Sta ons toe uw locatie te volgen. Dit helpt u uw uitgaven bij te houden en u veilig te houden.',
    },
    'c6jgvvhs': {
      'en': 'Change Changes',
      'es': 'Cambiar cambios',
      'nl': 'Wijzigingen wijzigen',
    },
    've31bfcg': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // integrationGptwPage
  {
    'ilyjnqe8': {
      'en': 'Integration with GPTW Survey Data',
      'es': 'Integración con datos de encuestas GPTW',
      'nl': 'Integratie met GPTW-enquêtegegevens',
    },
    'a8gko3jn': {
      'en': 'API Key',
      'es': 'Clave API',
      'nl': 'API sleutel',
    },
    'l19pyjgb': {
      'en': 'Enter your GPTW API key here...',
      'es': 'Ingrese su clave API GPTW aquí...',
      'nl': 'Voer hier uw GPTW API-sleutel in...',
    },
    'q2k91ipk': {
      'en': 'Sync Frequency',
      'es': 'Frecuencia de sincronización',
      'nl': 'Synchronisatiefrequentie',
    },
    'yhbvu69g': {
      'en': 'Every 24 Hours',
      'es': 'Cada 24 Horas',
      'nl': 'Elke 24 uur',
    },
    'sjvzoaf2': {
      'en': 'Every 24 Hours',
      'es': 'Cada 24 Horas',
      'nl': 'Elke 24 uur',
    },
    'l87vzt9k': {
      'en': 'Every Week',
      'es': 'Cada semana',
      'nl': 'Elke week',
    },
    '43bhttl2': {
      'en': 'Every Month',
      'es': 'Cada mes',
      'nl': 'Elke maand',
    },
    'd1g2vlgv': {
      'en': 'Every Quarter',
      'es': 'Cada cuarto',
      'nl': 'Ieder kwartier',
    },
    'f6iwxeds': {
      'en': 'Please select Syncing Frequency...',
      'es': 'Seleccione Frecuencia de sincronización...',
      'nl': 'Selecteer Synchronisatiefrequentie...',
    },
    'aqdc2jhz': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
      'nl': 'Zoek een artikel...',
    },
    'g33hgf0v': {
      'en': 'Set up Integration',
      'es': 'Configurar la integración',
      'nl': 'Integratie instellen',
    },
    '4xa2ea52': {
      'en': 'Integrate GPTW',
      'es': 'Integrar GPTW',
      'nl': 'Integreer GPTW',
    },
  },
  // chat_ai_Screen
  {
    'x9b0nomq': {
      'en': 'AI Guru',
      'es': 'Gurú de la IA',
      'nl': 'AI goeroe',
    },
    'msxzse39': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    '3rzg5sam': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'clfbtevj': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    '6bvl3rf1': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    '5ifoej0u': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'z11t8son': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'myan1y30': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    't4q3gsto': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'dgtra8ya': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    '319uxcyv': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    '7dvi6atg': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // homePage
  {
    'q9ap2ltu': {
      'en': 'Becoming Great Roadmap',
      'es': 'Convertirse en una gran hoja de ruta',
      'nl': 'Een geweldige routekaart worden',
    },
    'mzk9z8wv': {
      'en': 'Review the details below of your recent achievements.',
      'es': 'Revise los detalles a continuación de sus logros recientes.',
      'nl': 'Bekijk hieronder de details van uw recente prestaties.',
    },
    'fjv3jq9h': {
      'en': 'Create Milestone',
      'es': 'Crear hito',
      'nl': 'Mijlpaal creëren',
    },
    '17hi6s2e': {
      'en': 'Milestones Achieved',
      'es': 'Hitos alcanzados',
      'nl': 'Mijlpalen bereikt',
    },
    'dumcbyt8': {
      'en': '255',
      'es': '255',
      'nl': '255',
    },
    'wwig67tx': {
      'en': '32.2%',
      'es': '32,2%',
      'nl': '32,2%',
    },
    '55f95qg3': {
      'en': 'Upcoming Milestones',
      'es': 'Próximos hitos',
      'nl': 'Aankomende mijlpalen',
    },
    'rjxa48ma': {
      'en': '4',
      'es': '4',
      'nl': '4',
    },
    'sofxy3j4': {
      'en': '45.5%',
      'es': '45,5%',
      'nl': '45,5%',
    },
    's6ngwvbq': {
      'en': 'Upcoming Milestones',
      'es': 'Próximos hitos',
      'nl': 'Aankomende mijlpalen',
    },
    'rpnm2wy8': {
      'en': 'Below are some of your upcoming milestones to become great!',
      'es':
          '¡A continuación se muestran algunos de sus próximos hitos para volverse grande!',
      'nl':
          'Hieronder staan ​​enkele van uw aankomende mijlpalen om geweldig te worden!',
    },
    'fphw51y4': {
      'en': 'Milestone',
      'es': 'Hito',
      'nl': 'Mijlpaal',
    },
    'qmls77ju': {
      'en': 'Due Date',
      'es': 'Fecha de vencimiento',
      'nl': 'Deadline',
    },
    '8zwb81wm': {
      'en': 'Status',
      'es': 'Estado',
      'nl': 'Toestand',
    },
    'wxbnbwtj': {
      'en': 'Actions',
      'es': 'Comportamiento',
      'nl': 'Acties',
    },
    'cx0wwyh6': {
      'en': 'Self Reflection On Leadership Style',
      'es': 'Autorreflexión sobre el estilo de liderazgo',
      'nl': 'Zelfreflectie over leiderschapsstijl',
    },
    'kg8y3whc': {
      'en': 'Fri. April 11th',
      'es': 'Vie. 11 de abril',
      'nl': 'Vr. 11 april',
    },
    '77dtml6k': {
      'en': 'High',
      'es': 'Alto',
      'nl': 'Hoog',
    },
    'psex8xeb': {
      'en': ' Develop a Vision and Set of Core Values',
      'es': 'Desarrollar una visión y un conjunto de valores fundamentales',
      'nl': 'Ontwikkel een visie en een reeks kernwaarden',
    },
    'wtzbx5rr': {
      'en': 'Fri. April 11th',
      'es': 'Vie. 11 de abril',
      'nl': 'Vr. 11 april',
    },
    'atbdp0e3': {
      'en': 'High',
      'es': 'Alto',
      'nl': 'Hoog',
    },
    'kfi7rxvv': {
      'en': 'Implement Diversity and Inclusion Initiatives',
      'es': 'Implementar iniciativas de diversidad e inclusión',
      'nl': 'Implementeer diversiteits- en inclusie-initiatieven',
    },
    'b9dnoh7p': {
      'en': 'Fri. April 11th',
      'es': 'Vie. 11 de abril',
      'nl': 'Vr. 11 april',
    },
    'q5ckgu8j': {
      'en': 'Medium',
      'es': 'Medio',
      'nl': 'Medium',
    },
    'mbukrlsy': {
      'en': 'Foster Open and Effective Communication',
      'es': 'Fomentar la comunicación abierta y eficaz',
      'nl': 'Stimuleer open en effectieve communicatie',
    },
    'ubmrkxao': {
      'en': 'Fri. April 11th',
      'es': 'Vie. 11 de abril',
      'nl': 'Vr. 11 april',
    },
    'ihd2x0h2': {
      'en': 'Medium',
      'es': 'Medio',
      'nl': 'Medium',
    },
    'zffqkvmq': {
      'en': 'Recent Activity',
      'es': 'Actividad reciente',
      'nl': 'Recente activiteit',
    },
    '2a848q31': {
      'en': 'Below is an overview of milestones completed.',
      'es':
          'A continuación se muestra una descripción general de los hitos completados.',
      'nl': 'Hieronder vindt u een overzicht van de behaalde mijlpalen.',
    },
    'vd1y07pq': {
      'en': 'Milestones Set',
      'es': 'Conjunto de hitos',
      'nl': 'Mijlpalen ingesteld',
    },
    '1pdyab1l': {
      'en': 'Completed',
      'es': 'Terminado',
      'nl': 'Voltooid',
    },
    'usyx1bu1': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    'qho8e9n6': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'vgxibxo2': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    '7s2bs2wm': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    '20b0rofw': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'vf3d1qk8': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'sqy8v5ja': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    '3s64uhtw': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'slvg6uwf': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'ym4cv9lg': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    '9gn8g56j': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // homePage2
  {
    'nhcvwd3e': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'ba4814ed': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    's8s9pyj9': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'wdmn6vlz': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    '8pe04ccy': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'gjf27izb': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'z9ll1eo8': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'nnbvu7bh': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    't10cr2n7': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'rs42ykx1': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'woz92unf': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    'ckjumne2': {
      'en': 'Leadership Goals Set',
      'es': 'Objetivos de liderazgo establecidos',
      'nl': 'Leiderschapsdoelen ingesteld',
    },
    '16m8g78q': {
      'en': '24',
      'es': '24',
      'nl': '24',
    },
    'wvf9tgea': {
      'en': 'Development Activities Completed',
      'es': 'Actividades de desarrollo completadas',
      'nl': 'Ontwikkelingsactiviteiten voltooid',
    },
    'zq1xjrk3': {
      'en': '3,200',
      'es': '3.200',
      'nl': '3.200',
    },
    'c9eo6048': {
      'en': 'Current Leadership Cohort',
      'es': 'Cohorte de liderazgo actual',
      'nl': 'Huidig ​​leiderschapscohort',
    },
    'xagytms2': {
      'en': '4 Members',
      'es': '4 miembros',
      'nl': '4 leden',
    },
    'qforoyn8': {
      'en': 'Skill Development Progress',
      'es': 'Progreso del desarrollo de habilidades',
      'nl': 'Vooruitgang in de ontwikkeling van vaardigheden',
    },
    'rzwis2o3': {
      'en': 'Click To Open Your  Skill Development Plan',
      'es': 'Haga clic para abrir su plan de desarrollo de habilidades',
      'nl': 'Klik om uw vaardigheidsontwikkelingsplan te openen',
    },
    'u26z8mt2': {
      'en': 'Cultural Initiative Engagement',
      'es': 'Participación en iniciativas culturales',
      'nl': 'Betrokkenheid bij culturele initiatieven',
    },
    'y8e2rj27': {
      'en': 'Click To Open Your  Skill Development Plan',
      'es': 'Haga clic para abrir su plan de desarrollo de habilidades',
      'nl': 'Klik om uw vaardigheidsontwikkelingsplan te openen',
    },
    'dqi022pz': {
      'en': 'Assess Leadership Skills',
      'es': 'Evaluar las habilidades de liderazgo',
      'nl': 'Beoordeel leiderschapsvaardigheden',
    },
    '3590vv30': {
      'en': '__',
      'es': '__',
      'nl': '__',
    },
  },
  // homePage3
  {
    'yql1axtt': {
      'en': 'Become Great Insights',
      'es': 'Conviértase en grandes ideas',
      'nl': 'Word geweldige inzichten',
    },
    '58j1q8zi': {
      'en':
          'Below is an overview of insights based on on your survey resultsand  progress on becoming great ',
      'es':
          'A continuación se muestra una descripción general de los conocimientos basados ​​en los resultados de su encuesta y el progreso para llegar a ser excelente.',
      'nl':
          'Hieronder vindt u een overzicht van inzichten op basis van uw enquêteresultaten en de voortgang om geweldig te worden',
    },
    '6r9ce8ge': {
      'en': 'Organizational Alignment Score',
      'es': 'Puntuación de alineación organizacional',
      'nl': 'Score voor organisatie-afstemming',
    },
    '9v1i9ato': {
      'en': '78/100',
      'es': '78/100',
      'nl': '78/100',
    },
    'gstn6abf': {
      'en': 'Culture Evolution Progress',
      'es': 'Progreso de la evolución de la cultura',
      'nl': 'Vooruitgang van de cultuurevolutie',
    },
    'a2i5rdim': {
      'en': '43/100',
      'es': '43/100',
      'nl': '43/100',
    },
    'kikgagfv': {
      'en': 'Learning and Development Utilization',
      'es': 'Utilización del aprendizaje y el desarrollo',
      'nl': 'Gebruik van leren en ontwikkelen',
    },
    'g71zlgvy': {
      'en': '51/100',
      'es': '51/100',
      'nl': '51/100',
    },
    'c11559gd': {
      'en': 'Leadership Engagement Index',
      'es': 'Índice de compromiso del liderazgo',
      'nl': 'Leiderschapsbetrokkenheidsindex',
    },
    's58j7kdi': {
      'en': '64/100',
      'es': '64/100',
      'nl': '64/100',
    },
    '1ptegdfa': {
      'en': 'Employee Satisfaction',
      'es': 'Satisfacción del empleado',
      'nl': 'Werknemers tevredenheid',
    },
    'kvieucvg': {
      'en': '67%',
      'es': '67%',
      'nl': '67%',
    },
    'oxozsepl': {
      'en': 'Employee Engagement Score',
      'es': 'Puntuación de compromiso de los empleados',
      'nl': 'Score voor medewerkersbetrokkenheid',
    },
    'rc5xwef8': {
      'en': '55%',
      'es': '55%',
      'nl': '55%',
    },
    '0q2pfkxt': {
      'en': 'Progress To Become Great Certification',
      'es': 'Progreso para convertirse en una gran certificación',
      'nl': 'Vooruitgang om een ​​geweldige certificering te worden',
    },
    '7svbu42y': {
      'en': 'You’re 80% of the way there to receive your certification.',
      'es': 'Ya has recorrido el 80% del camino para recibir tu certificación.',
      'nl': 'U bent voor 80% op weg om uw certificering te ontvangen.',
    },
    'rv4ox3nw': {
      'en': '80%',
      'es': '80%',
      'nl': '80%',
    },
    'ko0ku48q': {
      'en': 'AI Analysises On Milestone Performance',
      'es': 'Análisis de IA sobre el rendimiento de los hitos',
      'nl': 'AI-analyses van mijlpaalprestaties',
    },
    'ar1fc6kb': {
      'en': 'Create tables and ui elements that work below.',
      'es':
          'Cree tablas y elementos de interfaz de usuario que funcionen a continuación.',
      'nl': 'Maak tabellen en ui-elementen die hieronder werken.',
    },
    'l6o3my7e': {
      'en': 'Category',
      'es': 'Categoría',
      'nl': 'Categorie',
    },
    'kxedmxui': {
      'en': 'Analysis Title',
      'es': 'Título del análisis',
      'nl': 'Analyse titel',
    },
    'f3lv4fxs': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    'xmchzwgo': {
      'en': 'Actions',
      'es': 'Comportamiento',
      'nl': 'Acties',
    },
    'ui7m4zuo': {
      'en': 'Employee Well-being',
      'es': 'Bienestar de los empleados',
      'nl': 'Welzijn van medewerkers',
    },
    '9179jlyh': {
      'en': 'A Descriptive Analysis of Employee Well-being Initiatives',
      'es':
          'Un análisis descriptivo de las iniciativas de bienestar de los empleados',
      'nl':
          'Een beschrijvende analyse van initiatieven op het gebied van het welzijn van werknemers',
    },
    'pbjxsvjn': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    'qncrhjmx': {
      'en': 'Diversity Iniatives',
      'es': 'Iniciativas de diversidad',
      'nl': 'Diversiteitsinitiatieven',
    },
    '66cbuxa4': {
      'en': 'Analyzing the Progress in Diversity and Inclusion Efforts',
      'es': 'Análisis del progreso en los esfuerzos de diversidad e inclusión',
      'nl':
          'Analyse van de vooruitgang op het gebied van inspanningen op het gebied van diversiteit en inclusie',
    },
    'dyzw4j2v': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    '65tbgasx': {
      'en': 'Productivity',
      'es': 'Productividad',
      'nl': 'Productiviteit',
    },
    '4m2rz0rh': {
      'en': 'An AI-Driven Overview of Recent Productivity Milestones',
      'es':
          'Una descripción general impulsada por la IA de los hitos de productividad recientes',
      'nl': 'Een AI-gestuurd overzicht van recente productiviteitsmijlpalen',
    },
    '6txv8k9p': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    'cpyj3a13': {
      'en': 'Collaboration',
      'es': 'Colaboración',
      'nl': 'Samenwerking',
    },
    'ybnonw57': {
      'en': 'Insights from AI-Powered Analysis of Collaborative Efforts',
      'es':
          'Perspectivas del análisis de esfuerzos colaborativos impulsado por IA',
      'nl':
          'Inzichten uit AI-aangedreven analyse van samenwerkingsinspanningen',
    },
    'tlxjjhas': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    'ga10ao5f': {
      'en': 'Leadership',
      'es': 'Liderazgo',
      'nl': 'Leiderschap',
    },
    'as0c5wds': {
      'en': 'An Analytical Review of Leadership Development Programs',
      'es':
          'Una revisión analítica de los programas de desarrollo del liderazgo',
      'nl':
          'Een analytisch overzicht van leiderschapsontwikkelingsprogramma\'s',
    },
    '2s73nq0e': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    '6so8n903': {
      'en': 'Productivity',
      'es': 'Productividad',
      'nl': 'Productiviteit',
    },
    'cfotscu5': {
      'en': 'Predictive Analysis on the Evolution of Remote Work Practices',
      'es':
          'Análisis predictivo sobre la evolución de las prácticas de trabajo remoto',
      'nl':
          'Voorspellende analyse van de evolutie van praktijken voor werken op afstand',
    },
    'euyu1zc4': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    'xc3khmae': {
      'en': 'Engagement Scores',
      'es': 'Puntuaciones de participación',
      'nl': 'Betrokkenheidsscores',
    },
    'v6acq2vs': {
      'en': 'AI-Assisted Examination of Engagement Scores Over Time',
      'es':
          'Examen de puntuaciones de participación asistido por IA a lo largo del tiempo',
      'nl':
          'AI-ondersteund onderzoek van betrokkenheidsscores in de loop van de tijd',
    },
    'q68nl1i1': {
      'en': 'Read',
      'es': 'Leer',
      'nl': 'Lezen',
    },
    'z26witvp': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    '90s44vgr': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'avnyr8wt': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'penngzec': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'c3z8w7bq': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    '2s5i1wr2': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'bx4dlt0k': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    'nhln5f6w': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'o5qdlvrq': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    '7x59c0k5': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    'hegl1n5w': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // homePage4
  {
    'oeonlvo4': {
      'en': 'Below is a summary of your day.',
      'es': 'A continuación se muestra un resumen de su día.',
      'nl': 'Hieronder vindt u een samenvatting van uw dag.',
    },
    '3n6l03u7': {
      'en': '16',
      'es': 'dieciséis',
      'nl': '16',
    },
    'i1otmkb8': {
      'en': 'New Activity',
      'es': 'Nueva actividad',
      'nl': 'Nieuwe activiteit',
    },
    'zm2mlbom': {
      'en': '16',
      'es': 'dieciséis',
      'nl': '16',
    },
    'gebnp7ii': {
      'en': 'Current Tasks',
      'es': 'Tareas actuales',
      'nl': 'Huidige taken',
    },
    'nyewx6yh': {
      'en': '16',
      'es': 'dieciséis',
      'nl': '16',
    },
    '1k3kdl8m': {
      'en': 'Completed Tasks',
      'es': 'Tareas completadas',
      'nl': 'Voltooide taken',
    },
    '09t9h23e': {
      'en': 'Current Route',
      'es': 'Ruta actual',
      'nl': 'Huidige route',
    },
    'ndt2u5le': {
      'en': 'An overview of your route.',
      'es': 'Una visión general de su ruta.',
      'nl': 'Een overzicht van uw route.',
    },
    'kevy27u5': {
      'en': '15/26',
      'es': '15/26',
      'nl': '15/26',
    },
    'g6wua3qe': {
      'en': 'Route progress',
      'es': 'Progreso de la ruta',
      'nl': 'Routevoortgang',
    },
    'qg37e8d9': {
      'en': '12',
      'es': '12',
      'nl': '12',
    },
    'mjd9ooi1': {
      'en': 'Tasks to be completed',
      'es': 'Tareas por completar',
      'nl': 'Taken die moeten worden voltooid',
    },
    'zvz380rj': {
      'en': 'Current Tasks',
      'es': 'Tareas actuales',
      'nl': 'Huidige taken',
    },
    'fkz5bjyu': {
      'en': 'A summary of your tasks',
      'es': 'Un resumen de tus tareas.',
      'nl': 'Een samenvatting van jouw taken',
    },
    '700aetq0': {
      'en': 'Task Type',
      'es': 'Tipo de tarea',
      'nl': 'Taaktype',
    },
    'dzoxdxlp': {
      'en':
          'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
      'es':
          'Descripción de la tarea aquí, esta es muy larga y tal vez se termine. Y va a dos líneas.',
      'nl':
          'Taakbeschrijving hier is deze erg lang en gaat hij misschien voorbij? En gaat naar twee regels.',
    },
    'vws7zmba': {
      'en': 'Due:',
      'es': 'Pendiente:',
      'nl': 'Vanwege:',
    },
    '69p6yvir': {
      'en': 'Today, 6:20pm',
      'es': 'Hoy, 18:20',
      'nl': 'Vandaag, 18.20 uur',
    },
    'jvqfjo1q': {
      'en': 'Update',
      'es': 'Actualizar',
      'nl': 'Update',
    },
    'poj8ggbr': {
      'en': '1',
      'es': '1',
      'nl': '1',
    },
    'o32cazzv': {
      'en': 'Task Type',
      'es': 'Tipo de tarea',
      'nl': 'Taaktype',
    },
    'vwj0hk6u': {
      'en': 'Task description here.',
      'es': 'Descripción de la tarea aquí.',
      'nl': 'Taakbeschrijving hier.',
    },
    'jqo6unar': {
      'en': 'Due:',
      'es': 'Pendiente:',
      'nl': 'Vanwege:',
    },
    'w92v0u8s': {
      'en': 'Today, 6:20pm',
      'es': 'Hoy, 18:20',
      'nl': 'Vandaag, 18.20 uur',
    },
    '73qoqmr7': {
      'en': 'Update',
      'es': 'Actualizar',
      'nl': 'Update',
    },
    'zk1g1lml': {
      'en': '1',
      'es': '1',
      'nl': '1',
    },
    '14hhgt83': {
      'en': 'Recent Activity',
      'es': 'Actividad reciente',
      'nl': 'Recente activiteit',
    },
    '37cr8u3j': {
      'en': 'Below is an overview of tasks & activity completed.',
      'es':
          'A continuación se muestra una descripción general de las tareas y actividades completadas.',
      'nl':
          'Hieronder vindt u een overzicht van de voltooide taken en activiteiten.',
    },
    '3flblaas': {
      'en': 'Tasks',
      'es': 'Tareas',
      'nl': 'Taken',
    },
    'owxq4884': {
      'en': 'Completed',
      'es': 'Terminado',
      'nl': 'Voltooid',
    },
    'y0e8qg80': {
      'en': 'Launches',
      'es': 'Lanzamientos',
      'nl': 'Lanceringen',
    },
    'e8xtd9dh': {
      'en': 'Last 30 Days',
      'es': 'Últimos 30 días',
      'nl': 'Laatste 30 dagen',
    },
    'siape6w3': {
      'en': 'Avg. Grade',
      'es': 'Promedio Calificación',
      'nl': 'Gem. Cijfer',
    },
    'muik9152': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'x9flqc0n': {
      'en': 'CultureWise',
      'es': 'CulturaWise',
      'nl': 'CultuurWise',
    },
    'cv6rrfjh': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'w2q3xbnq': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'bjyc2nlf': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'h2djslgj': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'ho54caas': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'k8viossv': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    'chyuc3my': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    '93adl4vt': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    '496u9a1c': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    'ycehqv5q': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // homePage5
  {
    '26sgjjp7': {
      'en': 'Overview',
      'es': 'Descripción general',
      'nl': 'Overzicht',
    },
    'mw2v09rl': {
      'en': 'Below is a company overview',
      'es': 'A continuación se muestra una descripción general de la empresa.',
      'nl': 'Hieronder vindt u een bedrijfsoverzicht',
    },
    'n0xf5czd': {
      'en': 'Andrew D.',
      'es': 'Andrés D.',
      'nl': 'Andreas D.',
    },
    'oiwm27vj': {
      'en': 'admin@gmail.com',
      'es': 'administrador@gmail.com',
      'nl': 'beheerder@gmail.com',
    },
    '2j6o17xd': {
      'en': 'Income this Month',
      'es': 'Ingresos este mes',
      'nl': 'Inkomen deze maand',
    },
    '5wwif2se': {
      'en': '\$567,402',
      'es': '\$567,402',
      'nl': '\$ 567.402',
    },
    'vqb5jjdp': {
      'en': 'Total Orders',
      'es': 'Órdenes totales',
      'nl': 'Totaal aantal bestellingen',
    },
    'aa1vesxc': {
      'en': '2,208',
      'es': '2,208',
      'nl': '2.208',
    },
    'voj41rpa': {
      'en': 'Total Orders',
      'es': 'Órdenes totales',
      'nl': 'Totaal aantal bestellingen',
    },
    'f3ngpl9w': {
      'en': '2,208',
      'es': '2,208',
      'nl': '2.208',
    },
    'opem3siw': {
      'en': 'Total Orders',
      'es': 'Órdenes totales',
      'nl': 'Totaal aantal bestellingen',
    },
    '02kg8wvj': {
      'en': '2,208',
      'es': '2,208',
      'nl': '2.208',
    },
    '4ow4icxh': {
      'en': 'Account Overview',
      'es': 'Descripción de cuenta',
      'nl': 'account overzicht',
    },
    'ylnf0phb': {
      'en': 'Your Balance',
      'es': 'Tu balance',
      'nl': 'Je balans',
    },
    '7922rlx7': {
      'en': '\$6,424.20',
      'es': '\$6.424,20',
      'nl': '\$ 6.424,20',
    },
    'bnlg5nqb': {
      'en': 'Transfer Balance',
      'es': 'Transferir saldo',
      'nl': 'Saldo overboeken',
    },
    '6ya41ks8': {
      'en': 'Monthly Goal',
      'es': 'Meta Mensual',
      'nl': 'Maandelijks doel',
    },
    'xkar1mz4': {
      'en': '62.2% /',
      'es': '62,2% /',
      'nl': '62,2% /',
    },
    '0aof4ab9': {
      'en': ' \$12,000',
      'es': '\$12,000',
      'nl': '\$ 12.000',
    },
    '88p1q8z5': {
      'en': 'Forecasted income is: ',
      'es': 'Los ingresos previstos son:',
      'nl': 'Het verwachte inkomen is:',
    },
    '0rjomtyx': {
      'en': '\$3,502',
      'es': '\$3,502',
      'nl': '\$ 3.502',
    },
    'xt7jd51d': {
      'en': 'Edit',
      'es': 'Editar',
      'nl': 'Bewerking',
    },
    'kyscpahf': {
      'en': 'Top Friends',
      'es': 'Mejores amigos',
      'nl': 'Top vrienden',
    },
    '0z9f3fqd': {
      'en': 'Rudy Fernandez',
      'es': 'Rudy Fernández',
      'nl': 'Rudy Fernandez',
    },
    '1suzhvpe': {
      'en': 'Manager',
      'es': 'Gerente',
      'nl': 'Manager',
    },
    'aa2so1sh': {
      'en': 'Abigail Herrara',
      'es': 'Abigail Herrera',
      'nl': 'Abigail Herrara',
    },
    'qqdjppkx': {
      'en': 'Designer',
      'es': 'Diseñador',
      'nl': 'Ontwerper',
    },
    'zcrfb57q': {
      'en': 'Liz Ambridge',
      'es': 'Liz Ambridge',
      'nl': 'Liz Ambridge',
    },
    'i8canc7x': {
      'en': 'Manager',
      'es': 'Gerente',
      'nl': 'Manager',
    },
    'u89bi8ot': {
      'en': 'Liz Rogers',
      'es': 'Liz Rogers',
      'nl': 'Liz Rogers',
    },
    'x8ntqmsk': {
      'en': 'Front End Dev',
      'es': 'Desarrollo front-end',
      'nl': 'Front-end ontwikkelaar',
    },
    '7uv41ytb': {
      'en': 'Outstanding Balance',
      'es': 'Saldo pendiente',
      'nl': 'Uitstaand saldo',
    },
    'vragctyx': {
      'en': '\$529,204',
      'es': '\$529,204',
      'nl': '\$ 529.204',
    },
    'ydw5r7x6': {
      'en': '55%',
      'es': '55%',
      'nl': '55%',
    },
    'lh56zmwu': {
      'en': 'Budget Overview',
      'es': 'Resumen del presupuesto',
      'nl': 'Budgetoverzicht',
    },
    '8gatkyyn': {
      'en': '\$242,102',
      'es': '\$242,102',
      'nl': '\$ 242.102',
    },
    'tbziqzb0': {
      'en': '25%',
      'es': '25%',
      'nl': '25%',
    },
    '6r2how7y': {
      'en': 'Outstanding Invoices',
      'es': 'Facturas pendientes',
      'nl': 'Openstaande facturen',
    },
    'o694qmme': {
      'en': 'Below are some of the outstanding invoices for your clients.',
      'es':
          'A continuación se muestran algunas de las facturas pendientes de sus clientes.',
      'nl': 'Hieronder vindt u een aantal openstaande facturen van uw klanten.',
    },
    '6ynl0nql': {
      'en': 'Add New',
      'es': 'Agregar nuevo',
      'nl': 'Nieuw toevoegen',
    },
    'mikhrkgo': {
      'en': 'Work Type',
      'es': 'Tipo de trabajo',
      'nl': 'Werk type',
    },
    'jwddr0h5': {
      'en': 'Sent To:',
      'es': 'Enviado a:',
      'nl': 'Verzonden naar:',
    },
    '4owi5nze': {
      'en': 'Contract Amount',
      'es': 'Monto del contrato',
      'nl': 'Contractbedrag',
    },
    'mi29v0ak': {
      'en': 'Status',
      'es': 'Estado',
      'nl': 'Toestand',
    },
    'v3how01x': {
      'en': 'Actions',
      'es': 'Comportamiento',
      'nl': 'Acties',
    },
    'arci7dpz': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'f8rz1h9n': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'a22uuumj': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'y6i4dz9y': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    '0zsbfiko': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    '98h6nrki': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'kpknexaq': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'beqjudw5': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'u45sodq5': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    's0boqj92': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    'xbv5cihj': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'nsg2fb0a': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'qij45qyf': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    '373hv3bc': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'c57uzef1': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    'nbkwu2q8': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'ahf9orwp': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'jdnngj36': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'nqwuoyyl': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'xu6xkt03': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    'lvk24m15': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'wc3jomnq': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'w0ounzso': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'd7r7i8km': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'hr0qlqt9': {
      'en': 'Pending',
      'es': 'Pendiente',
      'nl': 'In behandeling',
    },
    'lurvqvtg': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'yoy6c821': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'h1v1nbu0': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    '45qgagcf': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'b0dzgeas': {
      'en': 'Pending',
      'es': 'Pendiente',
      'nl': 'In behandeling',
    },
    '1wbi950j': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    '1vp8pbqh': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'hcyf8dvc': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    '9h7oiyxb': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    '4077khrs': {
      'en': 'Pending',
      'es': 'Pendiente',
      'nl': 'In behandeling',
    },
    '54lw9a9l': {
      'en': 'Card Header',
      'es': 'Encabezado de tarjeta',
      'nl': 'Kaartkop',
    },
    'hvcx5yao': {
      'en': 'Create tables and ui elements that work below.',
      'es':
          'Cree tablas y elementos de interfaz de usuario que funcionen a continuación.',
      'nl': 'Maak tabellen en ui-elementen die hieronder werken.',
    },
    'x1h509j3': {
      'en': 'Add New',
      'es': 'Agregar nuevo',
      'nl': 'Nieuw toevoegen',
    },
    '8vp5qede': {
      'en': 'Work Type',
      'es': 'Tipo de trabajo',
      'nl': 'Werk type',
    },
    '2tdruk3v': {
      'en': 'Assigned User',
      'es': 'Usuario asignado',
      'nl': 'Toegewezen gebruiker',
    },
    'c83yy40e': {
      'en': 'Contract Amount',
      'es': 'Monto del contrato',
      'nl': 'Contractbedrag',
    },
    'ofrcx1yv': {
      'en': 'Status',
      'es': 'Estado',
      'nl': 'Toestand',
    },
    '00wztti3': {
      'en': 'Actions',
      'es': 'Comportamiento',
      'nl': 'Acties',
    },
    '1xqlf7g4': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'br3lhd7q': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'nl2epbli': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'dl1m00b0': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'u2scrsxy': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    '58txnpk5': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'snc7z6l4': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    '7opj2zuw': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'z7q3n4a1': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    '797rdje4': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    'toa7gyuc': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'fy4lpnu3': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'xqm2s1jw': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'pdwp7iw9': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'pbbw5k9j': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    'e9v5p4xj': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'mynaeieb': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'pw9z72aq': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'ns0hq7b9': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'o1uz4vry': {
      'en': 'Paid',
      'es': 'Pagado',
      'nl': 'Betaald',
    },
    'jmquqk4f': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'j0eb005a': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'dwqzvqml': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'a0xmbqu2': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'jadz5xha': {
      'en': 'Pending',
      'es': 'Pendiente',
      'nl': 'In behandeling',
    },
    'fzkwusny': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    'do8vhpmi': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    'pzc3skvx': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'jt0a5ikc': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'ax2tv0bg': {
      'en': 'Pending',
      'es': 'Pendiente',
      'nl': 'In behandeling',
    },
    'o01kpju0': {
      'en': 'Design Work',
      'es': 'Trabajo de diseño',
      'nl': 'Design werk',
    },
    '55vvo3c9': {
      'en': 'Randy Peterson',
      'es': 'Randy Peterson',
      'nl': 'Randy Peterson',
    },
    '6n30bi2s': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'nl': 'Bedrijfsnaam',
    },
    'pp6c48s2': {
      'en': '\$2,100',
      'es': '\$2,100',
      'nl': '\$ 2.100',
    },
    'cp1fp9hk': {
      'en': 'Pending',
      'es': 'Pendiente',
      'nl': 'In behandeling',
    },
    'wfqqbdpi': {
      'en': 'CultureWise',
      'es': 'CulturaWise',
      'nl': 'CultuurWise',
    },
    'm224aakf': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'kjb4lpof': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'iq54u4o3': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'exji4t32': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'kgtj8ulm': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'ta3qolby': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    '6h2xikn5': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'ivrpnh04': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'ma3n6xwl': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    'wrdfs8p5': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // Details05Event
  {
    '3ti68de7': {
      'en': 'Leadership Mastery Retreat',
      'es': 'Retiro de dominio del liderazgo',
      'nl': 'Leiderschap Mastery Retreat',
    },
    'w6okkp06': {
      'en': '12:30pm',
      'es': '12:30 pm',
      'nl': '12.30 uur',
    },
    'g1vm36lf': {
      'en': 'Ardennen Retreat',
      'es': 'Retiro Ardennen',
      'nl': 'Ardennen retraite',
    },
    'emmbkw4i': {
      'en':
          'Join us in the serene setting of Aspen Meadows Resort for an immersive retreat designed for leaders aspiring to greatness...',
      'es':
          'Únase a nosotros en el entorno sereno de Aspen Meadows Resort para un retiro inmersivo diseñado para líderes que aspiran a la grandeza...',
      'nl':
          'Ga met ons mee in de serene omgeving van Aspen Meadows Resort voor een meeslepende retraite ontworpen voor leiders die streven naar grootsheid...',
    },
    'ph6b023q': {
      'en':
          'By protecting and preserving our oceans, we can effectively reduce global warming as healthy oceans absorb a significant amount of atmospheric carbon dioxide. Implementing measures to prevent overfishing, reducing plastic pollution, and conserving marine habitats will contribute to a balanced ocean ecosystem, ultimately mitigating global warming.',
      'es':
          'Al proteger y preservar nuestros océanos, podemos reducir efectivamente el calentamiento global, ya que los océanos sanos absorben una cantidad significativa de dióxido de carbono atmosférico. La implementación de medidas para prevenir la sobrepesca, reducir la contaminación plástica y conservar los hábitats marinos contribuirá a un ecosistema oceánico equilibrado y, en última instancia, mitigará el calentamiento global.',
      'nl':
          'Door onze oceanen te beschermen en te behouden, kunnen we de opwarming van de aarde effectief verminderen, aangezien gezonde oceanen een aanzienlijke hoeveelheid kooldioxide in de atmosfeer absorberen. Het implementeren van maatregelen om overbevissing te voorkomen, de plasticvervuiling terug te dringen en de mariene habitats te behouden, zal bijdragen aan een evenwichtig oceaanecosysteem, waardoor uiteindelijk de opwarming van de aarde wordt beperkt.',
    },
    '0jt1wbuh': {
      'en': 'Featured Speakers',
      'es': 'Oradores destacados',
      'nl': 'Uitgelichte luidsprekers',
    },
    '3f4xuzuq': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
      'nl': 'Adres',
    },
    'dm62kkey': {
      'en': '420 Magnificant Ocean Way',
      'es': '420 Magnífica Vía Oceánica',
      'nl': '420 Prachtige Ocean Way',
    },
    'udlf5oeq': {
      'en': 'Ardennen, BE, 91911',
      'es': 'Ardennen, BE, 91911',
      'nl': 'Ardennen, BE, 91911',
    },
    'wbqp7nja': {
      'en': 'Get Tickets',
      'es': 'Conseguir entradas',
      'nl': 'Krijg kaartjes',
    },
    'g0evxz66': {
      'en': 'View in Map',
      'es': 'Ver en el mapa',
      'nl': 'Bekijk op kaart',
    },
    'uo3ql3nl': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // eventListPage
  {
    'ku32ubsw': {
      'en': 'Events',
      'es': 'Eventos',
      'nl': 'Evenementen',
    },
    'sxaoiaqm': {
      'en': 'Leadership Mastery Retreat',
      'es': 'Retiro de dominio del liderazgo',
      'nl': 'Leiderschap Mastery Retreat',
    },
    '7tfjw41w': {
      'en': '\$210',
      'es': '\$210',
      'nl': '\$ 210',
    },
    'o9v85c96': {
      'en': '32 km away',
      'es': '32 kilómetros de distancia',
      'nl': '32 km verderop',
    },
    'qxvsatn4': {
      'en': '4.25',
      'es': '4.25',
      'nl': '4.25',
    },
    '19yunl76': {
      'en': 'Innovation and Culture Symposium',
      'es': 'Simposio de Innovación y Cultura',
      'nl': 'Innovatie- en cultuursymposium',
    },
    'izb0go7p': {
      'en': '\$210',
      'es': '\$210',
      'nl': '\$ 210',
    },
    'qp1blz3p': {
      'en': '48 km away',
      'es': '48 kilómetros de distancia',
      'nl': '48 km verderop',
    },
    '3xajpjvh': {
      'en': '4.25',
      'es': '4.25',
      'nl': '4.25',
    },
    'm18tbrxe': {
      'en': 'Courses',
      'es': 'Cursos',
      'nl': 'Cursussen',
    },
    '1zyyys5p': {
      'en': 'Mindful Leadership Mastery',
      'es': 'Dominio del liderazgo consciente',
      'nl': 'Mindful Leiderschap Meesterschap',
    },
    'ei8f9wq3': {
      'en': '\$67,99',
      'es': '\$67,99',
      'nl': '\$ 67,99',
    },
    'nhm1kn6b': {
      'en': '32 miles away',
      'es': '32 millas de distancia',
      'nl': '32 mijl verderop',
    },
    'aamhgq0b': {
      'en': '4.25',
      'es': '4.25',
      'nl': '4.25',
    },
    'm4jeuilu': {
      'en': 'Strategic Innovation Workshop',
      'es': 'Taller de Innovación Estratégica',
      'nl': 'Strategische innovatieworkshop',
    },
    '1ggm5rz3': {
      'en': '\$136,89',
      'es': '\$136,89',
      'nl': '\$ 136,89',
    },
    'ee1dhgmv': {
      'en': '32 miles away',
      'es': '32 millas de distancia',
      'nl': '32 mijl verderop',
    },
    '833nx40a': {
      'en': '4.25',
      'es': '4.25',
      'nl': '4.25',
    },
    '2dlyc6zn': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    'ms638szt': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'x9pirc73': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'lwqib4zq': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'c2srgbok': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'asnif8rn': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'o9k1xdgg': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    'nzns1c3t': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    '3jtmzkaw': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'mehfon0v': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    'gmezlbq0': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // coursePage
  {
    '6im54i3q': {
      'en': 'Class Details',
      'es': 'Detalles de la clase',
      'nl': 'Klassedetails',
    },
    'uk13kpz5': {
      'en': 'Mindful Leadership Mastery',
      'es': 'Dominio del liderazgo consciente',
      'nl': 'Mindful Leiderschap Meesterschap',
    },
    'et06mwf5': {
      'en': '10:00am',
      'es': '10:00 a.m',
      'nl': '10:00',
    },
    'xcm66dtt': {
      'en':
          'This course is designed for leaders who wish to integrate mindfulness into their leadership practice. It focuses on teaching participants how to use mindfulness techniques...',
      'es':
          'Este curso está diseñado para líderes que desean integrar la atención plena en su práctica de liderazgo. Se centra en enseñar a los participantes cómo utilizar técnicas de atención plena...',
      'nl':
          'Deze cursus is bedoeld voor leiders die mindfulness willen integreren in hun leiderschapspraktijk. Het richt zich op het leren van deelnemers hoe ze mindfulness-technieken kunnen gebruiken...',
    },
    'oy5ehuqb': {
      'en': '60m | High Intensity | Indoor/Outdoor',
      'es': '60m | Alta intensidad | Bajo techo, en exteriores',
      'nl': '60m | Hoge intensiteit | Binnen buiten',
    },
    '56kt87rh': {
      'en': 'Kye S',
      'es': 'Kye S',
      'nl': 'Kye S',
    },
    'lhjmnikk': {
      'en': 'Kye S',
      'es': 'Kye S',
      'nl': 'Kye S',
    },
    '41n5coi3': {
      'en': 'Kye S',
      'es': 'Kye S',
      'nl': 'Kye S',
    },
    'xjgxz2dh': {
      'en': 'Kye S',
      'es': 'Kye S',
      'nl': 'Kye S',
    },
    'ztvd1ap0': {
      'en': 'Reserve Spot',
      'es': 'Reservar lugar',
      'nl': 'Reserveer plek',
    },
  },
  // socialMediaPostPage
  {
    '66nvq6a9': {
      'en': 'MarketYou',
      'es': '',
      'nl': '',
    },
    '65tv6blk': {
      'en': 'Become Great Progress Posts',
      'es': 'Conviértase en publicaciones de gran progreso',
      'nl': 'Word geweldige voortgangsberichten',
    },
    'uvxvqtkl': {
      'en': 'Bio',
      'es': 'Biografía',
      'nl': 'Bio',
    },
    '6k8jpayr': {
      'en':
          'Want to share your progress in becoming great with your network? Here you\'ll find AI generated posts for you based on your recent progress!',
      'es':
          '¿Quiere compartir su progreso para volverse excelente con su red? ¡Aquí encontrarás publicaciones generadas por IA basadas en tu progreso reciente!',
      'nl':
          'Wilt u uw voortgang bij het worden van geweldige mensen delen met uw netwerk? Hier vindt u door AI gegenereerde berichten voor u op basis van uw recente voortgang!',
    },
    'ufrwcf9h': {
      'en': 'Social Posts',
      'es': 'Publicaciones sociales',
      'nl': 'Sociale berichten',
    },
    'dnrf0ij2': {
      'en':
          'Last month, we embraced the #GreatPlaceToWork philosophy and the journey\'s been transformative!\n\n✨ Embraced self-reflection, strengthening trust within our team.\n✨ Launched diversity and inclusion initiatives, enhancing our sense of belonging.\n\nWe\'re on our way to not just being a great place to work, but a phenomenal one. Stay tuned for more milestones on this exciting journey! 🌟 #LeadershipGrowth #InclusiveCulture #TeamWellbeing #LearningAndDevelopment',
      'es':
          '¡El mes pasado adoptamos la filosofía #GreatPlaceToWork y el viaje ha sido transformador!\n\n✨ Adoptamos la autorreflexión, fortaleciendo la confianza dentro de nuestro equipo.\n✨ Lanzamos iniciativas de diversidad e inclusión, potenciando nuestro sentido de pertenencia.\n\nEstamos en camino de ser no sólo un excelente lugar para trabajar, sino también fenomenal. ¡Estén atentos para conocer más hitos en este emocionante viaje! 🌟 #CrecimientoLiderazgo #CulturaInclusiva #BienestarEquipo #AprendizajeYDesarrollo',
      'nl':
          'Vorige maand hebben we de #GreatPlaceToWork-filosofie omarmd en de reis was transformatief!\n\n✨ Zelfreflectie omarmd, waardoor het vertrouwen binnen ons team versterkt wordt.\n✨ Diversiteits- en inclusie-initiatieven gelanceerd, waardoor ons gevoel van verbondenheid wordt vergroot.\n\nWe zijn op weg om niet alleen een geweldige, maar ook een fenomenale werkplek te worden. Blijf ons volgen voor meer mijlpalen op deze spannende reis! 🌟 #LeiderschapGroei #InclusiveCultuur #TeamWelzijn #LearningAndDevelopment',
    },
    'vq3o7wr9': {
      'en': '4',
      'es': '4',
      'nl': '4',
    },
    'jfwpjilq': {
      'en': '4',
      'es': '4',
      'nl': '4',
    },
    'd5w7uvk4': {
      'en':
          'In just one month, we\'ve turned our workspace into an innovation hub! 🚀\n\n✨ Dynamic teamwork amidst greenery and tech.\n✨ Ideas flowing in our modern, vibrant office.\n\nWe\'re redefining collaboration and wellness, one project at a time. Watch this space evolve! 💡 #InnovationHub #Teamwork #ModernWorkspace',
      'es':
          '¡En solo un mes, hemos convertido nuestro espacio de trabajo en un centro de innovación! 🚀\n\n✨ Trabajo en equipo dinámico en medio de vegetación y tecnología.\n✨ Ideas que fluyen en nuestra oficina moderna y vibrante.\n\nEstamos redefiniendo la colaboración y el bienestar, un proyecto a la vez. ¡Mira cómo evoluciona este espacio! 💡 #InnovationHub #Trabajo en equipo #Espacio de trabajo moderno',
      'nl':
          'In slechts één maand tijd hebben we van onze werkruimte een innovatiehub gemaakt! 🚀\n\n✨ Dynamisch teamwerk te midden van groen en techniek.\n✨ Ideeën stromen in ons moderne, levendige kantoor.\n\nWe herdefiniëren samenwerking en welzijn, project voor project. Zie hoe deze ruimte evolueert! 💡 #InnovationHub #Teamwork #ModernWorkspace',
    },
    'auk543d0': {
      'en': '4',
      'es': '4',
      'nl': '4',
    },
    'yv1705r8': {
      'en': '4',
      'es': '4',
      'nl': '4',
    },
    'fio5oafe': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    'qyc9i4mk': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    '17rqy1r0': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'lm549lt1': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    '3txjdx4r': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    '2o6smiyi': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'h677hkg7': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    'zti2pnrn': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'r0e0ahom': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'jste7fx7': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    '4lz6c1yg': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // createSocialPostPage
  {
    '5ecxy2lg': {
      'en': 'Send',
      'es': 'Enviar',
      'nl': 'Versturen',
    },
    '6criznqz': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'nl': 'Annuleren',
    },
    'svspcggc': {
      'en':
          'Last month, we embraced the #GreatPlaceToWork philosophy and the journey\'s been transformative!\n\n✨ Embraced self-reflection, strengthening trust within our team.\n✨ Launched diversity and inclusion initiatives, enhancing our sense of belonging.\n✨ Fostered open communication, sparking innovative ideas.\n\nWe\'re on our way to not just being a great place to work, but a phenomenal one. Stay tuned for more milestones on this exciting journey! 🌟 #LeadershipGrowth #InclusiveCulture #TeamWellbeing #LearningAndDevelopment',
      'es':
          '¡El mes pasado adoptamos la filosofía #GreatPlaceToWork y el viaje ha sido transformador!\n\n✨ Adoptamos la autorreflexión, fortaleciendo la confianza dentro de nuestro equipo.\n✨ Lanzamos iniciativas de diversidad e inclusión, potenciando nuestro sentido de pertenencia.\n✨ Fomenté la comunicación abierta, generando ideas innovadoras.\n\nEstamos en camino de ser no sólo un excelente lugar para trabajar, sino también fenomenal. ¡Estén atentos para conocer más hitos en este emocionante viaje! 🌟 #CrecimientoLiderazgo #CulturaInclusiva #BienestarEquipo #AprendizajeYDesarrollo',
      'nl':
          'Vorige maand hebben we de #GreatPlaceToWork-filosofie omarmd en de reis was transformatief!\n\n✨ Zelfreflectie omarmd, waardoor het vertrouwen binnen ons team versterkt wordt.\n✨ Diversiteits- en inclusie-initiatieven gelanceerd, waardoor ons gevoel van verbondenheid wordt vergroot.\n✨ Bevorderde open communicatie, waardoor innovatieve ideeën ontstonden.\n\nWe zijn op weg om niet alleen een geweldige, maar ook een fenomenale werkplek te worden. Blijf ons volgen voor meer mijlpalen op deze spannende reis! 🌟 #LeiderschapGroei #InclusiveCultuur #TeamWelzijn #LearningAndDevelopment',
    },
    '2yggl3ua': {
      'en': 'CultureWise',
      'es': 'CulturaWise',
      'nl': 'CultuurWise',
    },
    'ud2vqgc4': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    '56xfptn7': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'd6j562lk': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'hzbhtxng': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'ejfj7cb6': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'luz8chuw': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    'ylr5c8gd': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'cn1so2ds': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    '60czlp8y': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    '0oklaj8r': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // yearWrapupPage
  {
    'h3cd86py': {
      'en': '206',
      'es': '206',
      'nl': '206',
    },
    'irqnwel1': {
      'en': 'Milestones Achieved',
      'es': 'Hitos alcanzados',
      'nl': 'Mijlpalen bereikt',
    },
    'n42ubk6h': {
      'en': '13%',
      'es': '13%',
      'nl': '13%',
    },
    'y7f5dmbu': {
      'en': 'Increase in survey results',
      'es': 'Aumento de los resultados de las encuestas',
      'nl': 'Toename van enquêteresultaten',
    },
    'rth4bnls': {
      'en': 'Your Year Of Becoming Great, Wrapped Up!',
      'es': '¡Tu año para volverte grandioso, terminado!',
      'nl': 'Jouw jaar waarin je geweldig wordt, afgerond!',
    },
    'q6pihltu': {
      'en': 'My Year',
      'es': 'Mis estadísticas',
      'nl': 'Mijn statistieken',
    },
    '0qmxpt6c': {
      'en': '5.64k',
      'es': '5.64k',
      'nl': '5,64k',
    },
    'decwbq47': {
      'en': 'Employee Feedbacks Collected',
      'es': 'Comentarios de los empleados recopilados',
      'nl': 'Feedback van medewerkers verzameld',
    },
    'zroaq0zy': {
      'en': '3.21k',
      'es': '3.21k',
      'nl': '3,21k',
    },
    'f2mjwhka': {
      'en': 'Hours of Development Training',
      'es': 'Horas de Capacitación para el Desarrollo',
      'nl': 'Uren ontwikkelingstraining',
    },
    'uvhlfoia': {
      'en': '211',
      'es': '211',
      'nl': '211',
    },
    'ochhz9oa': {
      'en': 'Positive Culture Actions Logged\"',
      'es': 'Acciones de cultura positiva registradas\"',
      'nl': 'Positieve cultuuracties geregistreerd\"',
    },
    '1bpc71t8': {
      'en': '178',
      'es': '178',
      'nl': '178',
    },
    'tlcmpm79': {
      'en': 'Leadership Milestones Set',
      'es': 'Conjunto de hitos de liderazgo',
      'nl': 'Leiderschapsmijlpalen ingesteld',
    },
    '5s33e3c5': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    '5w3beys4': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'eac81xv0': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    '5121ii51': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'sqwk3nwe': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'f7aa47us': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    '2cr5qc4i': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    's9gcao2q': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'q2jprt8b': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'yjd9fk8s': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    'qndrpu0v': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // Details24QuizPage
  {
    'jh353v4i': {
      'en': 'Question 1/3',
      'es': 'Pregunta 1/3',
      'nl': 'Vraag 1/3',
    },
    'qg9a7caw': {
      'en':
          'I actively foster a culture of trust within my team by being transparent and consistent in my actions and communication.',
      'es':
          'Fomento activamente una cultura de confianza dentro de mi equipo siendo transparente y consistente en mis acciones y comunicación.',
      'nl':
          'Ik koester actief een cultuur van vertrouwen binnen mijn team door transparant en consistent te zijn in mijn acties en communicatie.',
    },
    'rxwhg9ag': {
      'en': 'On a scale of 1 - 3 how much do you agree?',
      'es': 'En una escala del 1 al 3 ¿cuánto estás de acuerdo?',
      'nl': 'Op een schaal van 1 tot 3, in welke mate bent u het ermee eens?',
    },
    'iv8o621z': {
      'en': 'Next Question',
      'es': 'Próxima pregunta',
      'nl': 'Volgende vraag',
    },
    'fn07en6u': {
      'en': 'Daily Quiz',
      'es': 'Prueba diaria',
      'nl': 'Dagelijkse quiz',
    },
    'vn7u7r4j': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // quiz2
  {
    'xkewp1dd': {
      'en': 'Question 2/3',
      'es': 'Pregunta 2/3',
      'nl': 'Vraag 2/3',
    },
    '9opbqtg4': {
      'en':
          'I effectively communicate my vision and goals to my team, ensuring that every member understands their role in achieving them.',
      'es':
          'Comunico eficazmente mi visión y mis objetivos a mi equipo, asegurándome de que cada miembro comprenda su papel para lograrlos.',
      'nl':
          'Ik communiceer mijn visie en doelstellingen effectief aan mijn team en zorg ervoor dat elk lid zijn of haar rol bij het bereiken ervan begrijpt.',
    },
    'gs32y0u3': {
      'en': 'On a scale from 1 - 5 how much do you agree?',
      'es': 'En una escala del 1 al 5 ¿cuánto estás de acuerdo?',
      'nl': 'Op een schaal van 1 tot 5, in welke mate bent u het ermee eens?',
    },
    'cm7vj35i': {
      'en': 'Strongly Agree  😇',
      'es': 'Totalmente de acuerdo 😇',
      'nl': 'Helemaal mee eens 😇',
    },
    '1y3xnipm': {
      'en': 'Agree 😃',
      'es': 'De acuerdo 😃',
      'nl': 'Mee eens 😃',
    },
    'aj9saze3': {
      'en': 'Neutral 🙂',
      'es': 'Neutro 🙂',
      'nl': 'Neutraal 🙂',
    },
    'bxdus51p': {
      'en': 'Disagree 😕',
      'es': 'En desacuerdo 😕',
      'nl': 'Niet mee eens 😕',
    },
    '2zy835hn': {
      'en': 'Strongly Disagree 😞',
      'es': 'Totalmente en desacuerdo 😞',
      'nl': 'Helemaal mee oneens 😞',
    },
    '2mcpf2eb': {
      'en': 'Next Question',
      'es': 'Próxima pregunta',
      'nl': 'Volgende vraag',
    },
    '4iysqu9t': {
      'en': 'Daily Quiz',
      'es': 'Prueba diaria',
      'nl': 'Dagelijkse quiz',
    },
    'ap6zc46p': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // scoreBoardPage
  {
    'zogas78t': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    '1jt0luvm': {
      'en': 'Within Organization',
      'es': 'Dentro de la organización',
      'nl': 'Binnen Organisatie',
    },
    'rll0c5px': {
      'en': 'Points: 100',
      'es': 'Puntos: 100',
      'nl': 'Punten: 100',
    },
    'verxfg3v': {
      'en': 'Between Organizations',
      'es': 'Entre Organizaciones',
      'nl': 'Tussen organisaties',
    },
    '8r2rg748': {
      'en': 'Great Place To Work',
      'es': 'Gran lugar para trabajar',
      'nl': 'Geweldige plek om te werken',
    },
    'wbgcp4kj': {
      'en': 'info@greatplacetowork.com',
      'es': 'info@greatplacetowork.com',
      'nl': 'info@greatplacetowork.com',
    },
    'btuhhmsn': {
      'en': 'Points: 200',
      'es': 'Puntos: 200',
      'nl': 'Punten: 200',
    },
    'aikb4p7l': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    'q3rrbct7': {
      'en': 'Dashboard',
      'es': 'Panel',
      'nl': 'Dashboard',
    },
    'hhop7igl': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'wes9zh2g': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    '9w6zkdiv': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    'mwbe3136': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'fg7gezm6': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    '8qxerdon': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    '0y740rv1': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'uzef0r99': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
  },
  // quiz2Copy
  {
    'nqjsqgcu': {
      'en': 'Question 3/3',
      'es': 'Pregunta 3/3',
      'nl': 'Vraag 3/3',
    },
    'pqx4b19q': {
      'en':
          'I regularly acknowledge and appreciate the individual and collective achievements of my team members, contributing to a positive workplace culture.',
      'es':
          'Regularmente reconozco y aprecio los logros individuales y colectivos de los miembros de mi equipo, contribuyendo a una cultura laboral positiva.',
      'nl':
          'Ik erken en waardeer regelmatig de individuele en collectieve prestaties van mijn teamleden, wat bijdraagt ​​aan een positieve werkcultuur.',
    },
    'f76sqxw6': {
      'en': 'On a scale from 1 - 5 how much do you agree?',
      'es': 'En una escala del 1 al 5 ¿cuánto estás de acuerdo?',
      'nl': 'Op een schaal van 1 tot 5, in welke mate bent u het ermee eens?',
    },
    'pa2gvluh': {
      'en': 'Strongly Agree  😇',
      'es': 'Totalmente de acuerdo 😇',
      'nl': 'Helemaal mee eens 😇',
    },
    '8cgjvb55': {
      'en': 'Agree 😃',
      'es': 'De acuerdo 😃',
      'nl': 'Mee eens 😃',
    },
    'r0jecl0y': {
      'en': 'Neutral 🙂',
      'es': 'Neutro 🙂',
      'nl': 'Neutraal 🙂',
    },
    'g229ep0m': {
      'en': 'Disagree 😕',
      'es': 'En desacuerdo 😕',
      'nl': 'Niet mee eens 😕',
    },
    'b1e8lh9r': {
      'en': 'Strongly Disagree 😞',
      'es': 'Totalmente en desacuerdo 😞',
      'nl': 'Helemaal mee oneens 😞',
    },
    'o1m1g3qx': {
      'en': 'Finish Quiz',
      'es': 'Terminar el cuestionario',
      'nl': 'Voltooi de quiz',
    },
    '4vvm4np3': {
      'en': 'Daily Quiz',
      'es': 'Prueba diaria',
      'nl': 'Dagelijkse quiz',
    },
    'bdzyvcij': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // yearWrapupPageCopy
  {
    'x4nnjwrr': {
      'en': 'Welcome to BecomeGreat! Your AI Powered Culture Coach.',
      'es':
          '¡Bienvenido a BecomeGreat! Su entrenador cultural impulsado por IA.',
      'nl': 'Welkom bij WordGreat! Uw AI-aangedreven cultuurcoach.',
    },
    'ad54y1ny': {
      'en': 'Quick Access',
      'es': 'Acceso rapido',
      'nl': 'Snelle toegang',
    },
    'iruk3hgd': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    'g9fmfo20': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    '5lqrgpdz': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'wncav259': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'humtohgl': {
      'en': 'BecomeGreat',
      'es': 'Conviértete en genial',
      'nl': 'Word geweldig',
    },
    'r2s8mdy4': {
      'en': 'Homepage',
      'es': 'Página principal',
      'nl': 'Startpagina',
    },
    '92sbfvne': {
      'en': 'Guru Chat',
      'es': 'Chat de gurú',
      'nl': 'Goeroe Chat',
    },
    '672gsqxy': {
      'en': 'MarketYou',
      'es': 'MercadoTu',
      'nl': 'MarktJe',
    },
    'o2rbii1g': {
      'en': 'Deep Insights',
      'es': 'Conocimientos profundos',
      'nl': 'Diepe inzichten',
    },
    '3b6us4vt': {
      'en': 'Skill Development Plan',
      'es': 'Plan de desarrollo de habilidades',
      'nl': 'Vaardigheidsontwikkelingsplan',
    },
    'cpdv8cmh': {
      'en': 'Courses & Events',
      'es': 'Cursos y Eventos',
      'nl': 'Cursussen & Evenementen',
    },
    'vvjt86eg': {
      'en': 'Scoreboard',
      'es': 'Marcador',
      'nl': 'Scorebord',
    },
    'homnq9vj': {
      'en': 'Year Wrap-Up',
      'es': 'Resumen del año',
      'nl': 'Jaarafsluiting',
    },
    'lfqs9a1o': {
      'en': 'Settings',
      'es': 'Ajustes',
      'nl': 'Instellingen',
    },
    '5eaqwnyh': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // chat_ai_Screen_1
  {
    'r4w2mtxb': {
      'en': 'Ai Chat',
      'es': '',
      'nl': '',
    },
    'ip8z9ud8': {
      'en': 'Home',
      'es': 'Hogar',
      'nl': 'Thuis',
    },
  },
  // emptyList
  {
    'rv46u5l6': {
      'en': 'Send START to begin!',
      'es': '¡Chat Ai activo!',
      'nl': 'Ai-chat actief!',
    },
  },
  // aiChat_Component
  {
    'mt698ngo': {
      'en': 'Copy response',
      'es': 'Copiar respuesta',
      'nl': 'Kopieer het antwoord',
    },
    '1jifzmx3': {
      'en': 'Type something...',
      'es': 'Escribe algo...',
      'nl': 'Typ iets...',
    },
  },
  // emptyList_1
  {
    'wagwj5bj': {
      'en': 'Ai Chat Active!',
      'es': '',
      'nl': '',
    },
    'w70nskny': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'es':
          '¡¡¡IMPORTANTE!!! Necesito hacer:\nVaya a la acción a continuación y actualice su clave API para que este chat funcione.\n\nPuede obtener una clave API en:',
      'nl':
          'BELANGRIJK!!! Moeten doen:\nGa naar de onderstaande actie en update uw API-sleutel zodat deze chat werkt.\n\nU kunt een API-sleutel verkrijgen op:',
    },
    '1gjyi579': {
      'en': 'https://platform.openai.com',
      'es': 'https://plataforma.openai.com',
      'nl': 'https://platform.openai.com',
    },
    '1i01gfh5': {
      'en': 'Watch Tutorial',
      'es': 'Ver el tutorial',
      'nl': 'Bekijk de tutorial',
    },
  },
  // aiChat_Component_1
  {
    '5mjbsz6t': {
      'en': 'Copy response',
      'es': '',
      'nl': '',
    },
    '5sow5xau': {
      'en': 'Type something...',
      'es': '',
      'nl': '',
    },
  },
  // Miscellaneous
  {
    'lc0stnw5': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'r2gjp697': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'us9jukft': {
      'en':
          'Please Allow CultureWise To Send You Notifications To Improve Your Leadership Skills!',
      'es':
          '¡Permita que CultureWise le envíe notificaciones para mejorar sus habilidades de liderazgo!',
      'nl':
          'Laat CultureWise u meldingen sturen om uw leiderschapsvaardigheden te verbeteren!',
    },
    'h8qcbuvl': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '2y9u5876': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '42ok1pbr': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'v0blr1zd': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '84qsxspk': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'ndrv1680': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '4jxcvnta': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'nbxdyt53': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '8zw7dgjh': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '0yuzsgo3': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '2zc6d35g': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'd7tc1kho': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'rqzulxyk': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'rxpreej9': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'k78wmo2k': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'sa4qu069': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'rqswa3g5': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'b6tkqkfa': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '8jh2mlke': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'eopen4w0': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'f4wl1fgb': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'k85ebwmp': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '8j692t58': {
      'en': '',
      'es': '',
      'nl': '',
    },
    '23rpuxz9': {
      'en': '',
      'es': '',
      'nl': '',
    },
    'bpnar7di': {
      'en': '',
      'es': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
