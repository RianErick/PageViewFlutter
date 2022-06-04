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
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Rian Erick"),
              accountEmail: Text("riznzx@gmail.com"),
              currentAccountPicture: CircleAvatar(child: Text("R")),
            ),
            ListTile(
              title: Text("Item 1"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _pageController.jumpToPage(0);
                Navigator.pop(context);
                setState(() {
                  indexBottomNaviBar = 0;
                });
              },
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottomNaviBar = 0;
                });
              },
            ),
            ListTile(
              title: Text("Item 3"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
                setState(
                  () {
                    indexBottomNaviBar = 2;
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: PageView(controller: _pageController, children: [
        Container(
          color: Colors.white,
          child: Text("Imagens"),
        ),
        Container(
          color: Colors.white,
          child: Text("Anotações"),
        ),
        Container(
          color: Colors.white,
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
                icon: Icon(Icons.text_fields_outlined), label: "Textos"),
          ]),
    );
  }
}
