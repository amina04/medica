import 'package:flutter/material.dart';

class Poches {
  //les colones de table student
  int _poche;
  int _volume_poche;

  //un constructeur pour remplir le table
  Poches(
    this._volume_poche,
  );
  Poches.map(dynamic obj) {
    this._volume_poche = obj['volume_poche'];
    this._poche = obj['poche'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get poche => _poche;
  int get volume_poche => _volume_poche;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['volume_poche'] = _volume_poche;

    if (poche != null) {
      map['poche'] = _poche;
    }

    return map;
  }

  Poches.fromMap(Map<String, dynamic> map) {
    this._volume_poche = map['volume_poche'];
    this._poche = map['poche'];
  }
}
