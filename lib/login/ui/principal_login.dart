import 'package:flutter/material.dart';
import '../../prefs/ui/principal_prefs.dart';
import '../../src/ui/new_search.dart';
import '../../src/ui/principal_search.dart';
import 'package:marvel/login/ui/documentation_comics.dart';

class PrincipalLogin extends StatelessWidget {
  const PrincipalLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalLoginMenu(),
    );
  }
}

class PrincipalLoginMenu extends StatefulWidget {
  const PrincipalLoginMenu({Key key}) : super(key: key);

  @override
  State<PrincipalLoginMenu> createState() => _PrincipalLoginMenuState();
}

class _PrincipalLoginMenuState extends State<PrincipalLoginMenu> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [PrincipalSearch(), PrincipalPrefs(), NewSearchBanner(), DocumentationMenuComics()];
    //List<Widget> pages = [NewSearchBanner(), PrincipalPrefs()];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      body: _bodyPrincipalLogin(page: pages[currentIndex]),

      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapFunction,
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        elevation: 0,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.line_weight_sharp, color: Colors.red), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.red), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_outlined, color: Colors.amber), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.find_in_page_rounded, color: Colors.red),
              label: ""),
        ],
      ),
    );
  }

  void onTapFunction(int index){
    setState(() {
      currentIndex = index;
    });
  }

  Widget _bodyPrincipalLogin({@required Widget page}) {
    return Center(
      child: page,
    );
  }


}

