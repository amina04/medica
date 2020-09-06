import 'package:flutter/material.dart';

class Calculs {
  //les colones de table student
  double _reliquat;
  int _qte_consomme;
  int _stabilite;
  //=====clé etrangers====
  int _FKmedId;
  String _FKDatePre;

  //un constructeur pour remplir le table
  Calculs(
    this._reliquat,
    this._qte_consomme,
      this._stabilite,
    this._FKmedId,
    this._FKDatePre,
  );
  Calculs.map(dynamic obj) {
    this._reliquat = obj['reliquat'];
    this._qte_consomme = obj['qte_consomme'];
    this._stabilite = obj['stabilite'];
    this._FKDatePre = obj['FKDatePre'];
    this._FKmedId = obj['FKmedId'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  double get reliquat => _reliquat;
  int get qte_consomme => _qte_consomme;
  int get stabilite => _stabilite;
  int get FKmedId => _FKmedId;
  String get FKDatePre => _FKDatePre;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['reliquat'] = _reliquat;
    map['qte_consomme'] = _qte_consomme;
    map['stabilite'] = _stabilite;
    map['FKDatePre'] = _FKDatePre;
    map['FKmedId'] = _FKmedId;

    return map;
  }

  Calculs.fromMap(Map<String, dynamic> map) {
    this._reliquat = map['reliquat'];
    this._qte_consomme = map['qte_consomme'];
    this._stabilite = map['stabilite'];
    this._FKDatePre = map['FKDatePre'];
    this._FKmedId = map['FKmedId'];
  }
}
