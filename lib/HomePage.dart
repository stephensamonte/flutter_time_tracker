import 'package:flutter/material.dart';
import './DayListFragment.dart' as DayListFragment;
import './AddCategoryPage.dart' as AddCategoryPage;
import './Utility/Variables.dart' as Variables;
import './Utility/SQLlocalStorage.dart' as SQLlocalStorage;

import './CategoriesPage.dart' as CategoriesPage;
import './DayChartsPage.dart' as DayChartsPage;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  static const String routeName = "/HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title;

  @override
  void initState() {
    title = "Time Tracker";
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          new PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              onSelected: showMenuSelection,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: 'ResetDB',
                    child: const ListTile(
                        leading: const Icon(Icons.warning),
                        title: const Text('Reset Database'))),
                const PopupMenuItem<String>(
                    value: 'CategoriesPage',
                    child: const ListTile(
                        leading: const Icon(Icons.list),
                        title: const Text('Categories'))),
                const PopupMenuItem<String>(
                    value: 'DayChartsPage',
                    child: const ListTile(
                        leading: const Icon(Icons.list),
                        title: const Text('Charts')))

                //              new IconButton(
//                icon: new Icon(Icons.calendar_today),
//                tooltip: 'Calendar',
//                onPressed: () {
//                  Navigator.of(context).pushNamed(CalMainNavigationDrawer
//                      .CalMainNavigationDrawer.routeName);
//                }, //
//              ),
//                    const PopupMenuItem<String>(
//                        value: 'Settings',
//                        child: const ListTile(
//                            leading: const Icon(Icons.settings),
//                            title: const Text('Settings'))),
//                const PopupMenuItem<String>(
//                    value: 'Feedback',
//                    child: const ListTile(
//                        leading: const Icon(Icons.feedback),
//                        title: const Text('Feedback')))
              ]),

        ],
      ),
      body: new DayListFragment.DayListFragment(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

          // pass date as parameter
          Variables.dataDateAddItem = DateTime.now();

          // Open add new category
          Navigator.of(context).pushNamed(AddCategoryPage.AddCategoryPage.routeName);

        },
        tooltip: 'Add Category',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// App bar action selection.
  showMenuSelection(String value) {
    switch (value) {
      case "ResetDB":
        // reset the database
        SQLlocalStorage.resetDatabase();

        break;
      case "Settings":


//        Navigator.of(context).pushNamed("/SettingsPage");
        break;

      case "CategoriesPage":
        // navigate to categories page
        Navigator.of(context).pushNamed(CategoriesPage.CategoriesPage.routeName);
        break;

      case "DayChartsPage":
      // navigate to categories page
        Navigator.of(context).pushNamed(DayChartsPage.DayChartsPage.routeName);
        break;



      case "Feedback":

      // open feedback url
//        MyUtility.launchURL("https://goo.gl/forms/MLEthJSxgQGgiYQJ2");
        break;
      default:
      // todo notify user that there was an error
    }
//    showInSnackBar('You selected: $value');
  }
}
