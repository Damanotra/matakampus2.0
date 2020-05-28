import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matakampus2/bloc/hometab/hometabbloc.dart';
import 'package:matakampus2/models/barang.dart';

class BerandaTab extends StatefulWidget {
  @override
  _BerandaTabState createState() => _BerandaTabState();
}


class _BerandaTabState extends State<BerandaTab> {
  final _hometabBloc = HometabBloc();

  TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
            child: Row(children: <Widget>[
              Image.asset('assets/image/logo-trans.png')
            ],),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder(
            bloc: _hometabBloc,
            builder: (context, state) {
              return Container(
                child: ListView(
                  shrinkWrap: false,
                  children: <Widget>[
                    _buildTemuanToday(),
                    _buildTemuanNew(),
                    _buildTemuanOld()
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
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        height: 192,
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: Text('Hari ini')),
              GestureDetector(child: Text('Lihat Semua'))
            ]),
            content,
          ],
        ),
      ),
    );
  }

  Widget _temuanListToday() {
    List<Barang> temuanListToday;
    temuanListToday = [
      Barang('Botol Tupperware Warna Biru', '2701'),
      Barang('Mouse Logitech Biru', '2403'),
      Barang('Buku tulis', 'Selasar Gor')
    ];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: temuanListToday.length,
      itemBuilder: (context, index) {
        final item = temuanListToday[index];
        return Container(
          height: 128,
          width: 128,
          child: Column(
            children: <Widget>[
              Container(
                  height: 72,
                  child: Image.asset('assets/image/logo-trans.png')),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(item.nama),
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
      },
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