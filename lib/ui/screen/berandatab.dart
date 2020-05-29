import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matakampus2/bloc/hometab/hometabbloc.dart';
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
  final _hometabBloc = HometabBloc();
  final _hometabTodayBloc = TodayBloc();
  final RefreshController _todayRefreshController = RefreshController();

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: <Widget>[
                Image.asset('assets/image/logo-trans.png'),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(32)),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder(
            bloc: _hometabBloc,
            builder: (context, state) {
              return Container(
                color: Colors.grey[200],
                child: ListView(
                  children: <Widget>[
                    _buildTemuanToday()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTemuanToday() {
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

  Widget _dummyToday(){
    Barang item = Barang(name:'Botol Tupperware Warna Biru', location: '2701');
    return Container(
      height: 128,
      width: 128,
      child: Column(
        children: <Widget>[
          Container(
              height: 72,
              child: Image.asset('assets/image/tupperware.png')),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Text(item.name),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.white),
                    Text(item.location)
                  ],
                )
              ],
            ),
          )
        ],
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
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Center(
                    child: Text(state.errorMessage),
                    heightFactor: 20,
                  )
                ],
              ),
            );
          }

          if (state.listbarang.isEmpty && !state.hasLoadAllItem) {
            _hometabTodayBloc.dispatch(
              TodayRefreshEvent(context),
            );
            return Container();
          }

          if (state.listbarang.isEmpty) {
            return ListRefresher(
              onRefresh: _todayOnRefresh,
              onLoading: _todayOnLoading,
              refreshController: _todayRefreshController,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Center(
                    child: Text('Tidak Ada Barang',style: TextStyle(color: Colors.white)),
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
              itemCount: state.listbarang.length,
              itemBuilder: (context,index){
                return Container(
                  height: 136,
                  width: 136,
                  margin: EdgeInsets.all(8),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Container(height: 72,width: 128,decoration: BoxDecoration(image: DecorationImage(alignment: Alignment.topCenter,fit: BoxFit.cover,image: NetworkImage(state.listbarang[index].photo)))),
                        Padding(padding: EdgeInsets.fromLTRB(8,8,8,8),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
                          Text(state.listbarang[index].name,style: TextStyle(fontSize: 10),overflow: TextOverflow.ellipsis),
                          SizedBox(height: 4),
                          Row(children: <Widget>[
                            Icon(Icons.location_on,size: 10),
                            SizedBox(width: 4),
                            Text(state.listbarang[index].location,style: TextStyle(fontSize: 10))
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

  Widget _buildTemuanNew() {
    Widget content;
    content = _temuanListNew();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text('7 hari terakhir')),
              GestureDetector(child: Text('LIHAT SEMUA'))
            ],
          )
        ],
      ),
    );
  }

  Widget _temuanListNew() {}

  _buildTemuanOld() {}
}

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;

  CustomAppBar({@required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: child,
    );
  }
}
