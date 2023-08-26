import 'package:flutter/material.dart';
import 'package:prata2/DoorChart.dart';
import 'package:prata2/user.dart';



class DashboardApp extends StatelessWidget {
  late String nameuser,password;
  DashboardApp ({required this.nameuser,required this.password,});
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameuser = TextEditingController(text: nameuser);
    final TextEditingController _password = TextEditingController(text: password);
    return MaterialApp(
      title: 'Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Welcome to dashboard ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () => _onNavItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              selected: _selectedIndex == 1,
              onTap: () => _onNavItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              selected: _selectedIndex == 2,
              onTap: () => _onNavItemTapped(2),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: <Widget> [
          Text('Menu Pilihan',style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Colors.lightBlueAccent),textAlign: TextAlign.center,),
          SizedBox(height: 10,),
          Container(
            height: 150,
            width: 200,
            child: GridView.count(
                crossAxisCount: 2,
              children: <Widget> [
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pintu(),
                        ),
                      );
                    },
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('images/pintu.png',height: 100,fit: BoxFit.fill),
                          Text("Pintu", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => User(),
                        ),
                      );},
                    splashColor: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.asset('images/imagestiga.png',height: 100,fit: BoxFit.fill),
                          Text("User", style: TextStyle(fontSize: 17.0)),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              Image.asset('images/imagesdua.png',height: 333,fit: BoxFit.fill,),
            ],
          ),

        ],
      ),
    );
  }
}



class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Notifications Screen'),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}