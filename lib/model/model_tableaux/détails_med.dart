import 'package:flutter/material.dart';

class Detail_medicament {
  //les colones de table student

  String _nom_labo;
  double _presentation;
  int _prix;
  double _c_init;
  double _c_min;
  double _c_max;
  double _volume;
  int _verre_4;
  int _verre_25;
  int _PVC_25;

  //=====clé etrangers====
  int _FKmedId;
  //un constructeur pour remplir le table
  Detail_medicament(
      this._FKmedId,
      this._nom_labo,
      this._presentation,
      this._prix,
      this._c_init,
      this._c_min,
      this._c_max,
      this._volume,
      this._verre_4,
      this._verre_25,
      this._PVC_25);
  Detail_medicament.map(dynamic obj) {
    this._nom_labo = obj['nom_labo'];
    this._presentation = obj['presentation'];
    this._prix = obj['prix'];
    this._c_init = obj['c_init'];
    this._c_min = obj['c_min'];
    this._c_max = obj['c_max'];
    this._volume = obj['volume'];
    this._verre_4 = obj['verre_4'];
    this._verre_25 = obj['verre_25'];
    this._PVC_25 = obj['PVC_25'];
    this._FKmedId = obj['FKmedId'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux

  String get nom_labo => _nom_labo;
  double get presentation => _presentation;
  int get prix => _prix;
  double get c_init => _c_init;
  double get c_min => _c_min;
  double get c_max => _c_max;
  double get volume => _volume;
  int get verre_4 => _verre_4;
  int get verre_25 => _verre_25;
  int get PVC_25 => _PVC_25;
  int get FKmedId => _FKmedId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['nom_labo'] = _nom_labo;
    map['presentation'] = _presentation;
    map['prix'] = _prix;
    map['c_init'] = _c_init;
    map['c_min'] = _c_min;
    map['c_max'] = _c_max;
    map['volume'] = _volume;
    map['verre_4'] = _verre_4;
    map['verre_25'] = _verre_25;
    map['PVC_25'] = _PVC_25;
    // map['FKmedId'] = _FKmedId;
    if (FKmedId != null) {
      map['FKmedId'] = _FKmedId;
    }

    return map;
  }

  Detail_medicament.fromMap(Map<String, dynamic> map) {
    this._nom_labo = map['nom_labo'];
    this._presentation = map['presentation'];
    this._prix = map['prix'];
    this._c_init = map['c_init'];
    this._c_min = map['c_min'];
    this._c_max = map['c_max'];
    this._volume = map['volume'];
    this._verre_4 = map['verre_4'];
    this._verre_25 = map['verre_25'];
    this._PVC_25 = map['PVC_25'];
    this._FKmedId = map['FKmedId'];
  }
}
