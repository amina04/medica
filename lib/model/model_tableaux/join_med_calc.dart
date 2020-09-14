import 'package:flutter/material.dart';

class Join_Med_Calc {
  //les colones de table student
  int _id_medicament;
  String _nom;
  int _qte_disponible;
  double _volume_flacon;
  //les colones de table calcul
  String _reliquat;
  int _qte_consomme;
  String _stabilite;
  double _prix_reliquat;
  //=====clé etrangers====
  int _FKmedId2;
  String _FKDatePre;
  //un constructeur pour remplir le table
  Join_Med_Calc(
      this._nom,
      this._qte_disponible,
      this._volume_flacon,
      this._reliquat,
      this._qte_consomme,
      this._stabilite,
      this._prix_reliquat,
      this._FKmedId2,
      this._FKDatePre,
      );

  Join_Med_Calc.map(dynamic obj) {
    this._nom = obj['nom'];
    this._qte_disponible = obj['qte_disponible'];
    this._volume_flacon = obj['volume_flacon'];
    this._id_medicament = obj['id_medicament'];
    this._reliquat = obj['reliquat'];
    this._qte_consomme = obj['qte_consomme'];
    this._stabilite = obj['stabilite'];
    this._prix_reliquat = obj['prix_reliquat'];
    this._FKDatePre = obj['FKDatePre'];
    this._FKmedId2 = obj['FKmedId2'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_medicament => _id_medicament;
  String get nom => _nom;
  int get qte_disponible => _qte_disponible;
  double get volume_flacon => _volume_flacon;
  String get reliquat => _reliquat;
  int get qte_consomme => _qte_consomme;
  String get stabilite => _stabilite;
  double get prix_reliquat => _prix_reliquat;
  int get FKmedId2 => _FKmedId2;
  String get FKDatePre => _FKDatePre;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['nom'] = _nom;
    map['qte_disponible'] = _qte_disponible;
    map['volume_flacon'] = _volume_flacon;
    map['reliquat'] = _reliquat;
    map['qte_consomme'] = _qte_consomme;
    map['stabilite'] = _stabilite;
    map['prix_reliquat'] = _prix_reliquat;
    map['FKDatePre'] = _FKDatePre;
    map['FKmedId2'] = _FKmedId2;
    if (id_medicament != null) {
      map['id_medicament'] = _id_medicament;
    }
    return map;
  }

  Join_Med_Calc.fromMap(Map<String, dynamic> map) {
    this._nom = map['nom'];
    this._qte_disponible = map['qte_disponible'];
    this._volume_flacon = map['volume_flacon'];
    this._id_medicament = map['id_medicament'];
    this._reliquat = map['reliquat'];
    this._qte_consomme = map['qte_consomme'];
    this._stabilite = map['stabilite'];
    this._prix_reliquat = map['prix_reliquat'];
    this._FKDatePre = map['FKDatePre'];
    this._FKmedId2 = map['FKmedId2'];
  }
}
