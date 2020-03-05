import 'package:fluttcher/core/utils/utils.dart';
import 'package:flutter/material.dart';

import 'module.model.dart';

///
/// ModulesPage
///
class ModulesPage extends StatefulWidget {
  ModulesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ModulesPageState createState() => _ModulesPageState();
}

///
/// State for the ModulesPage
///
class _ModulesPageState extends State<ModulesPage> {
  final _scrollController = new ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(height: 30),
          ),
          Expanded(
            child: _buildBody(context),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final _listModules = <Module>[];
    return StreamBuilder<dynamic>(
      stream: delayedYielder(Duration(seconds: 1), [
        Module(name: 'Pedido'),
        Module(name: 'Cliente'),
        Module(name: 'Produto')
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        _listModules.add(snapshot.data);
        return ListView(
          controller: _scrollController,
          padding: const EdgeInsets.only(top: 20.0),
          children:
              _listModules.map((e) => _buildListItem(context, e)).toList(),
        );
      },
    );
  }

  Widget _buildListItem(BuildContext context, Module module) {
    return Padding(
      key: ValueKey(module.name),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 4, right: 8),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text(module.name.toString())],
          ),
          onTap: () => print(module.name),
        ),
      ),
    );
  }
}
