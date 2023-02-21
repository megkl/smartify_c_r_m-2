import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:smartify_c_r_m/backend/service_account_json.dart';
import 'package:url_launcher/url_launcher.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:http/http.dart' as http;

import 'backend/calendar_client.dart';
import 'backend/secrets.dart';
import 'database/profile_database_helper.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();
  
  obtainCredentials();
  // await clientViaUserConsent(_clientID, _scopes, prompt).then((AuthClient client) async {
  //   CalendarClient.calendar = cal.CalendarApi(client);
  // });
  runApp(MyApp());
}
Future<AuthClient> obtainCredentials() async {
  var _clientID = new ClientId(Secret.ANDROID_CLIENT_ID, "");
  const _scopes = const [cal.CalendarApi.calendarScope];
  final accountCredentials = ServiceAccountCredentials.fromJson(ServiceAccount.serviceAccJson);
  
  AuthClient client = await clientViaServiceAccount(accountCredentials, _scopes);
  CalendarClient.calendar = cal.CalendarApi(client);
  return client;
}
void prompt(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<SmartifyCRMFirebaseUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
    userStream = smartifyCRMFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      title: 'Smartify CRM',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('id'),
        Locale('ms'),
      ],
      theme: ThemeData(brightness: Brightness.light,textTheme: GoogleFonts.outfitTextTheme(textTheme).copyWith(
      bodyText2: GoogleFonts.outfit(textStyle: textTheme.bodyText2),
    ),),
      darkTheme: ThemeData(brightness: Brightness.dark, fontFamily: 'Outfit'),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': HomeWidget(),
      'Main_customerList': MainCustomerListWidget(),
      'myTeam': MyTeamWidget(),
      'Main_Contracts': MainContractsWidget(),
      'Main_profilePage': MainProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: FlutterFlowTheme.of(context).primaryColor,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.dashboard_rounded,
                size: 32,
              ),
              label: FFLocalizations.of(context).getText(
                'homeNav' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervised_user_circle_outlined,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.supervised_user_circle_sharp,
                size: 32,
              ),
              label: FFLocalizations.of(context).getText(
                '3ourv2w9' /* __ */,
              ),
              tooltip: '',
            ),
           BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.list,
                size: 24,
              ),
              label: FFLocalizations.of(context).getText(
                'smtxdnbn' /* __ */,
              ),
              tooltip: '',
            ),
             BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_copy,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.folder,
                size: 32,
              ),
              label: FFLocalizations.of(context).getText(
                'j08eiorc' /* __ */,
              ),
              tooltip: '',
            ),
            
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.settings,
                size: 32,
              ),
              label: FFLocalizations.of(context).getText(
                'o3dp9tss' /* __ */,
              ),
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
