import 'package:flutter/material.dart';
import './DayChartsFragment.dart' as DayChartsFragment;
import './AddCategoryPage.dart' as AddCategoryPage;
import './Utility/Variables.dart' as Variables;
import './Utility/SQLlocalStorage.dart' as SQLlocalStorage;

import './CategoriesPage.dart' as CategoriesPage;

class DayChartsPage extends StatefulWidget {
  DayChartsPage({Key key}) : super(key: key);

  static const String routeName = "/DayChartsPage";

  @override
  _DayChartsPageState createState() => _DayChartsPageState();
}

class _DayChartsPageState extends State<DayChartsPage> {
  String title;

  @override
  void initState() {
    super.initState();
    title = "Day Charts";
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
                        title: const Text('Categories')))
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
      body: new DayChartsFragment.DayChartsFragment(),

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
