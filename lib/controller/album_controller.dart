import '../models/album_model.dart';
import 'package:flutter/material.dart';

class AlbumDetailProvider extends ChangeNotifier {
  // Stream and Sink Process di sini !!!
  ListAlbumModel? selectedAlbum;

  void selectAlbum(ListAlbumModel data) {
    selectedAlbum = data;
    notifyListeners();
  }
}

