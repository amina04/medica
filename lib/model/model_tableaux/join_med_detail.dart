import 'package:flutter/material.dart';

class Join_med_detail {
  //les colones de table student
  int _id_medicament;
  String _nom;
  int _qte_disponible;
  double _volume_flacon;
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
  Join_med_detail(
      this._nom,
      this._qte_disponible,
      this._volume_flacon,
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
      this._PVC_25
      );

  Join_med_detail.map(dynamic obj) {
    this._nom = obj['nom'];
    this._qte_disponible = obj['qte_disponible'];
    this._volume_flacon = obj['volume_flacon'];
    this._id_medicament = obj['id_medicament'];
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
  int get id_medicament => _id_medicament;
  String get nom => _nom;
  int get qte_disponible => _qte_disponible;
  double get volume_flacon => _volume_flacon;
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
    map['nom'] = _nom;
    map['qte_disponible'] = _qte_disponible;
    map['volume_flacon'] = _volume_flacon;
    if (id_medicament != null) {
      map['id_medicament'] = _id_medicament;

    }
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
      map['FKmedId'] = _FKmedId;}
    return map;
  }
//hhhh
  Join_med_detail.fromMap(Map<String, dynamic> map) {
    this._nom = map['nom'];
    this._qte_disponible = map['qte_disponible'];
    this._volume_flacon = map['volume_flacon'];
    this._id_medicament = map['id_medicament'];
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
