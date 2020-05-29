import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:matakampus2/models/barang.dart';
import 'package:matakampus2/resources/provider/api/firestore_api.dart';


import '../locator.dart';

class BarangService extends ChangeNotifier {
  FirestoreAPI _api = locator<FirestoreAPI>();

  List<Barang> list_barang;


  Future<List<Barang>> getList() async {
    var result = await _api.getDataCollection();
    print(result.toString());
    list_barang = result.documents
        .map((doc) => Barang.fromMap(doc.data, doc.documentID))
        .toList();
    print(list_barang);
    return list_barang;
  }

  Stream<QuerySnapshot> fetchBarangAsStream() {
    return _api.streamDataCollection();
  }

  Future<Barang> getBarangById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Barang.fromMap(doc.data, doc.documentID) ;
  }

  Future removeBarang(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateBarang(Barang data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addBarang(Barang data) async{
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }


}
