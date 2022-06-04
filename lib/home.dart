import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNaviBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BLOCO DE NOTAS"),
      ),
      body: PageView(controller: _pageController, children: [
        Container(
          color: Colors.white,
          child: Text("Imagens"),
        ),
        Container(
          color: Colors.green,
          child: Text("Anotações"),
        ),
        Container(
          color: Colors.amber,
          child: Text("Textos"),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNaviBar,
          onTap: (int page) {
            setState(() {
              indexBottomNaviBar = page;
            });
            _pageController.animateToPage(page,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo), label: "Imagens"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notes), label: "Anotações"),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_decrease), label: "Textos"),
          ]),
    );
  }
}
