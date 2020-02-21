import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/widget/webview.dart';

class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;

  const SubNav({Key key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });
    int seperate = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, seperate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(seperate, subNavList.length),
          ),
        )
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebView(
                          url: model.url,
                          statusBarColor: model.statusBarColor,
                          hideAppBar: model.hideAppBar,
                        )));
          },
          child: Column(
            children: <Widget>[
              Image.network(
                model.icon,
                width: 32,
                height: 32,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  model.title,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ));
  }
}

//class GridNav extends StatefulWidget {
//  final GridNavModel gridNavModel;
//  final String name;
//
//  const GridNav({Key key,@required this.gridNavModel, this.name='xiaoming'}) : super(key: key);
//  @override
//  _GridNavState createState() => _GridNavState();
//}
//
//class _GridNavState extends State<GridNav> {
//  @override
//  Widget build(BuildContext context) {
//    return Text(widget.name);
//  }
//}
