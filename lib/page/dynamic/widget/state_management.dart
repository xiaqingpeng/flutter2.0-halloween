import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../model/counter.dart';
import '../../../model/color_them_provider.dart';

// ignore: camel_case_types
class StateManagement extends StatefulWidget {
  @override
  _StateManagementState createState() => _StateManagementState();
}

// ignore: camel_case_types
class _StateManagementState extends State<StateManagement> {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Counter>(context).count;
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: Center(
        child: Column(
          children: [
            ExpansionTile(
              title: Text('颜色主题'),
              leading: Icon(Icons.color_lens),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: <Widget>[
                      ...Colors.primaries.map(
                        (color) => Material(
                          color: color,
                          child: InkWell(
                            onTap: () {
                              // print(color);
                              // print(color.toString());
                              
                              Provider.of<ColorThemeProvider>(context, listen: false)
                                  .changeColor(color:color);
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Text(
                '$count',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 100),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Provider.of<Counter>(context, listen: false).add(),
        },
        child: Icon(Icons.add,color: Colors.white,),
        
      ),
    );
  }
}
