import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List arrPopupMenuItems = ["A", "B", "C", "D", "E"];

  String mInitialValue = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            snap:true,
            floating:true,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle),
                SizedBox(width: 11,),
                Text("Home")
              ],
            ),
            elevation: 25,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(21))
            ),
            bottom: PreferredSize(child: Container(

            ), preferredSize: Size(double.infinity, 100)),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              PopupMenuButton(
                  initialValue: mInitialValue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21)
                  ),
                  tooltip: "Settings",
                  onSelected: (value) {
                    mInitialValue = value.toString();
                    setState(() {});
                  },
                  itemBuilder: (_) {
                    return arrPopupMenuItems.map((e) =>
                        PopupMenuItem(
                            value: e,
                            onTap: () {

                            },
                            child: Text('Item $e'))).toList();
                  })
            ],
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) => ListTile(title: Text('${index+1}'),)))
        ],
      ),
    );
  }
}

//AppBar(
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.account_circle),
//             SizedBox(width: 11,),
//             Text("Home")
//           ],
//         ),
//         elevation: 25,
//         shadowColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(21))
//         ),
//         bottom: PreferredSize(child: Container(
//
//         ), preferredSize: Size(double.infinity, 300)),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(Icons.account_circle)),
//           IconButton(onPressed: (){}, icon: Icon(Icons.add)),
//           PopupMenuButton(
//             initialValue: mInitialValue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(21)
//               ),
//               tooltip: "Settings",
//               onSelected: (value){
//               mInitialValue = value.toString();
//               setState((){});
//               },
//               itemBuilder: (_){
//             return arrPopupMenuItems.map((e) => PopupMenuItem(
//               value: e,
//                 onTap: (){
//
//                 },
//                 child: Text('Item $e'))).toList();
//           })
//         ],
//       )
