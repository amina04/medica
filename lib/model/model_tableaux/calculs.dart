import 'package:flutter/material.dart';

class Calculs {
  //les colones de table calcul
  String _reliquat;
  int _qte_consomme;
  String _stabilite;
  double _prix_reliquat;

  //=====clé etrangers====
  int _FKmedId2;
  String _FKDatePre;

  //un constructeur pour remplir le table
  Calculs(
    this._reliquat,
    this._qte_consomme,
      this._stabilite,
      this._prix_reliquat,
    this._FKmedId2,
    this._FKDatePre,
  );
  Calculs.map(dynamic obj) {
    this._reliquat = obj['reliquat'];
    this._qte_consomme = obj['qte_consomme'];
    this._stabilite = obj['stabilite'];
    this._prix_reliquat = obj['prix_reliquat'];
    this._FKDatePre = obj['FKDatePre'];
    this._FKmedId2 = obj['FKmedId2'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  String get reliquat => _reliquat;
  int get qte_consomme => _qte_consomme;
  String get stabilite => _stabilite;
  double get prix_reliquat => _prix_reliquat;
  int get FKmedId2 => _FKmedId2;
  String get FKDatePre => _FKDatePre;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['reliquat'] = _reliquat;
    map['qte_consomme'] = _qte_consomme;
    map['stabilite'] = _stabilite;
    map['prix_reliquat'] = _prix_reliquat;
    map['FKDatePre'] = _FKDatePre;
    map['FKmedId2'] = _FKmedId2;

    return map;
  }

  Calculs.fromMap(Map<String, dynamic> map) {
    this._reliquat = map['reliquat'];
    this._qte_consomme = map['qte_consomme'];
    this._stabilite = map['stabilite'];
    this._prix_reliquat = map['prix_reliquat'];
    this._FKDatePre = map['FKDatePre'];
    this._FKmedId2 = map['FKmedId2'];
  }
}
