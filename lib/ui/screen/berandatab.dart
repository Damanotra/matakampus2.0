import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:matakampus2/bloc/hometab/berandatabbloc.dart';
import 'package:matakampus2/bloc/hometab/today/today_bloc.dart';
import 'package:matakampus2/bloc/hometab/today/today_event.dart';
import 'package:matakampus2/bloc/hometab/today/today_state.dart';
import 'package:matakampus2/models/barang.dart';
import 'package:matakampus2/ui/widgets/listview/list_refresher.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BerandaTab extends StatefulWidget {
  @override
  _BerandaTabState createState() => _BerandaTabState();
}

class _BerandaTabState extends State<BerandaTab> {
  final _hometabBloc = BerandatabBloc();
  final _hometabTodayBloc = TodayBloc();
//  final _hometabNewBloc = NewBloc();
//  final _hometabOldBloc = OldBloc();
  final RefreshController _todayRefreshController = RefreshController();
  final RefreshController _newRefreshController = RefreshController();
  final RefreshController _oldRefreshController = RefreshController();

  TextEditingController _searchController;

  void _todayOnRefresh() {
    _hometabTodayBloc.dispatch(
      TodayRefreshEvent(context),
    );
    _todayRefreshController.refreshCompleted();
  }

  void _todayOnLoading() {
    _todayRefreshController.loadComplete();
  }

//  void _newOnRefresh() {
//    _hometabTodayBloc.dispatch(
//      TodayRefreshEvent(context),
//    );
//    _newRefreshController.refreshCompleted();
//  }
//
//  void _newOnLoading() {
//    _todayRefreshController.loadComplete();
//  }
//
//  void _oldOnRefresh() {
//    _hometabTodayBloc.dispatch(
//      TodayRefreshEvent(context),
//    );
//    _oldRefreshController.refreshCompleted();
//  }
//
//  void _oldOnLoading() {
//    _todayRefreshController.loadComplete();
//  }

  Widget _buildSearchBar(){
    return
      TextField(
        controller: _searchController,
        decoration: InputDecoration.collapsed(
          hintText: 'Cari barangmu',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 12),
            child: Row(
              children: <Widget>[
                Image.asset('assets/image/logo-trans.png'),
                SizedBox(width: 4),
                Container(
                  width: MediaQuery.of(context).size.width-156,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Color.fromRGBO(154, 154, 154, 1))
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(margin:EdgeInsets.all(8),child: Icon(Icons.search,size: 16)),
                      Expanded(child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),)
                    ],),
                )
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: ListView(
              shrinkWrap: false,
              children: <Widget>[
                _buildTemuanToday(),
                //_buildTemuanNew(),
                //_buildTemuanOld()
              ],
            )
        )
    );
  }

  Widget _buildTemuanToday(){
    Widget content;
    content = _temuanListToday();

    return Padding(
      padding: EdgeInsets.fromLTRB(0,8,0,8),
      child: Container(
        height: 184,
        color: Colors.orange,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 24,top: 16,right: 24,bottom: 0),
              child: Row(children: <Widget>[
                Expanded(child: Text('Hari ini',style: TextStyle(color: Colors.white),)),
                GestureDetector(child: Text('Lihat Semua',style: TextStyle(color: Colors.white)),
                  onTap: (){
                    Navigator.of(context).pushNamed('/barang-ditemukan');
                  },
                )
              ]
              ),
            ),
            content,
          ],
        ),
      ),
    );
  }

  Widget _temuanListToday(){
    return Container(
      height: 144,
      child: BlocBuilder(
        bloc: _hometabTodayBloc,
        builder: (context,TodayState state){
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.errorMessage != null && state.errorMessage != '') {
            return ListRefresher(
              onRefresh: _todayOnRefresh,
              onLoading: _todayOnLoading,
              refreshController: _todayRefreshController,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text(state.errorMessage),
                    heightFactor: 20,
                  )
                ],
              ),
            );
          }

          if (state.items.isEmpty && !state.hasLoadAllItem) {
            _hometabTodayBloc.dispatch(
              TodayRefreshEvent(context),
            );
            return Container();
          }

          if (state.items.isEmpty) {
            return ListRefresher(
              onRefresh: _todayOnRefresh,
              onLoading: _todayOnLoading,
              refreshController: _todayRefreshController,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Text('Tidak Ada Barang'),
                    heightFactor: 20,
                  )
                ],
              ),
            );
          }

          return ListRefresher(
            onLoading: _todayOnLoading,
            onRefresh: _todayOnRefresh,
            refreshController:_todayRefreshController,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.items.length,
              itemBuilder: (context,index){
                return Container(
                  height: 136,
                  width: 136,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Container(height: 72,width: 128,decoration: BoxDecoration(image: DecorationImage(alignment: Alignment.topCenter,fit: BoxFit.cover,image: AssetImage('assets/image/botol.png')))),
                        Padding(padding: EdgeInsets.fromLTRB(8,8,8,8),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                          Text(state.items[index].name,style: TextStyle(fontSize: 10)),
                          SizedBox(height: 4),
                          Row(children: <Widget>[
                            Icon(Icons.location_on,size: 10),
                            SizedBox(width: 4),
                            Text(state.items[index].location,style: TextStyle(fontSize: 10))
                          ],)
                        ],))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}