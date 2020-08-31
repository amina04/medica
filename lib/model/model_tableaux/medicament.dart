import 'package:flutter/material.dart';

class Medicament {
  //les colones de table student
  int _id_medicament;
  String _nom;
  double _qte_disponible;
  double _volume_flacon;
  //un constructeur pour remplir le table
  Medicament(
    this._nom,
    this._qte_disponible,
    this._volume_flacon,
  );

  Medicament.map(dynamic obj) {
    this._nom = obj['nom'];
    this._qte_disponible = obj['qte_disponible'];
    this._volume_flacon = obj['volume_flacon'];
    this._id_medicament = obj['id_medicament'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_medicament => _id_medicament;
  String get nom => _nom;
  double get qte_disponible => _qte_disponible;
  double get volume_flacon => _volume_flacon;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['nom'] = _nom;
    map['qte_disponible'] = _qte_disponible;
    map['volume_flacon'] = _volume_flacon;
    if (id_medicament != null) {
      map['id_medicament'] = _id_medicament;
    }
    return map;
  }

  Medicament.fromMap(Map<String, dynamic> map) {
    this._nom = map['nom'];
    this._qte_disponible = map['qte_disponible'];
    this._volume_flacon = map['volume_flacon'];
    this._id_medicament = map['id_medicament'];
  }
}
