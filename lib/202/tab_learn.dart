import 'package:flutter/material.dart';
import 'package:flutter_learn_full/deneme_page.dart';
import 'package:flutter_learn_full/navigate_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchedValue = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          bottomNavigationBar: BottomAppBar(
            notchMargin: _notchedValue,
            // shape: CircularNotchedRectangle(), **mainin içindeki theme e yazmak daha mantıklı ve iyi, temiz kod açısından
            child: _myTabView(),
          ),
          appBar: AppBar(),
          body: _tabBarView(),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        indicatorColor: Colors.yellow,
        //isScrollable: true,  ***Sıkıştırmak için
        labelColor: Colors.green,
        unselectedLabelColor: Colors.black,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}')).toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
        /****Manuel elle sağa sola gitme özelliğini kapatıyor.*****/
        //  physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          DenemePage(),
          NavigateLearnDart(),
          DenemePage(),
          DenemePage(),
        ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewsExtension on _MyTabViews {}
