import 'package:flutter/material.dart';

class Calculs {
  //les colones de table student
  double _reliquat;
  double _qte_consomme;
  //=====clé etrangers====
  int _FKmedId;
  String _FKDatePre;

  //un constructeur pour remplir le table
  Calculs(
    this._reliquat,
    this._qte_consomme,
    this._FKmedId,
    this._FKDatePre,
  );
  Calculs.map(dynamic obj) {
    this._reliquat = obj['reliquat'];
    this._qte_consomme = obj['qte_consomme'];
    this._FKDatePre = obj['FKDatePre'];
    this._FKmedId = obj['FKmedId'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  double get reliquat => _reliquat;
  double get qte_consomme => _qte_consomme;
  int get FKmedId => _FKmedId;
  String get FKDatePre => _FKDatePre;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['reliquat'] = _reliquat;
    map['qte_consomme'] = _qte_consomme;
    map['FKDatePre'] = _FKDatePre;
    map['FKmedId'] = _FKmedId;

    return map;
  }

  Calculs.fromMap(Map<String, dynamic> map) {
    this._reliquat = map['reliquat'];
    this._qte_consomme = map['qte_consomme'];
    this._FKDatePre = map['FKDatePre'];
    this._FKmedId = map['FKmedId'];
  }
}
