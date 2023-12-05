import 'package:flutter/material.dart';
import 'package:learn_linked/src/presentation/pages/home/home_event.dart';
import 'package:learn_linked/src/presentation/utils/base_color.dart';

class HomeBottomBar extends StatelessWidget {
  HomeEvent vm;
  BuildContext context;

  HomeBottomBar(this.context, this.vm);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: BACKGROUND_COLOR,
      currentIndex: vm.currentIndex,
      fixedColor: Colors.white,
      unselectedItemColor: Colors.grey[400],
      selectedFontSize: 12.0,
      unselectedFontSize: 10.0,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        vm.currentIndex = index;
      },
      items: const [
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.book, color: Colors.white), label: 'Recursos'),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.library_books, color: Colors.white), label: 'Mis Recursos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.groups, color: Colors.white), label: 'Grupos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, color: Colors.white), label: 'Mis Grupos'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white), label: 'Perfil')
      ],
    );
  }
}
