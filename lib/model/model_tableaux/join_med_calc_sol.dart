import 'package:flutter/material.dart';

class Join_med_calc_sol {
  //les colones de table student
  int _id_medicament;
  String _nom;
  int _qte_disponible;
  double _volume_flacon;
  //les colones de table student
  String _reliquat;
  int _qte_consomme;
  String _stabilite;
  double _prix_reliquat;
  String _etat;
  //=====clé etrangers====
  int _FKmedId;
  String _FKDatePre;
  //les colones de table student
  int _id_solution;
  String _date_preparation;
  double _posologie;
  int _reduction;
  double _dose_administrer;
  double _volume_finale;
  //=====clé etrangers====
  int _FKmedId2;
  int _FKpoche;
  int _FKpatientId;
  //un constructeur pour remplir le table
  Join_med_calc_sol(
      this._nom,
      this._qte_disponible,
      this._volume_flacon,
      this._reliquat,
      this._qte_consomme,
      this._stabilite,
      this._prix_reliquat,
      this._etat,
      this._FKmedId,
      this._FKDatePre,
      this._date_preparation,
      this._posologie,
      this._reduction,
      this._dose_administrer,
      this._volume_finale,

      this._FKmedId2,
      this._FKpoche,
      this._FKpatientId,
      );

  Join_med_calc_sol.map(dynamic obj) {
    this._nom = obj['nom'];
    this._qte_disponible = obj['qte_disponible'];
    this._volume_flacon = obj['volume_flacon'];
    this._id_medicament = obj['id_medicament'];
    this._reliquat = obj['reliquat'];
    this._qte_consomme = obj['qte_consomme'];
    this._stabilite = obj['stabilite'];
    this._prix_reliquat = obj['prix_reliquat'];
    this._etat = obj['etat'];
    this._FKDatePre = obj['FKDatePre'];
    this._FKmedId = obj['FKmedId'];
    this._FKmedId2 = obj['FKmedId2'];
    this._id_solution = obj['id_solution'];
    this._date_preparation = obj['date_preparation'];
    this._posologie = obj['posologie'];
    this._reduction = obj['reduction'];
    this._dose_administrer = obj['dose_administrer'];
    this._volume_finale = obj['volume_finale'];

    this._FKpoche = obj['FKpoche'];
    this._FKpatientId = obj['FKpatientId'];
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
  String get etat => _etat;
  int get FKmedId => _FKmedId;
  String get FKDatePre => _FKDatePre;
  int get id_solution => _id_solution;
  String get date_preparation => _date_preparation;
  double get posologie => _posologie;
  int get reduction => _reduction;
  double get dose_administrer => _dose_administrer;
  double get volume_finale => _volume_finale;
  int get FKmedId2 => _FKmedId2;
  int get FKpoche => _FKpoche;
  int get FKpatientId => _FKpatientId;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['nom'] = _nom;
    map['qte_disponible'] = _qte_disponible;
    map['volume_flacon'] = _volume_flacon;
    map['reliquat'] = _reliquat;
    map['qte_consomme'] = _qte_consomme;
    map['stabilite'] = _stabilite;
    map['prix_reliquat'] = _prix_reliquat;
    map['etat'] = _etat;
    map['FKDatePre'] = _FKDatePre;
    map['FKmedId'] = _FKmedId;
    map['FKmedId2'] = _FKmedId2;
    map['date_preparation'] = _date_preparation;
    map['posologie'] = _posologie;
    map['reduction'] = _reduction;
    map['dose_administrer'] = _dose_administrer;
    map['volume_finale'] = _volume_finale;

    map['FKpoche'] = _FKpoche;
    map['FKpatientId'] = _FKpatientId;
    if (id_solution != null) {
      map['id_solution'] = _id_solution;
    }

    if (id_medicament != null) {
      map['id_medicament'] = _id_medicament;
    }
    return map;
  }

  Join_med_calc_sol.fromMap(Map<String, dynamic> map) {
    this._nom = map['nom'];
    this._qte_disponible = map['qte_disponible'];
    this._volume_flacon = map['volume_flacon'];
    this._id_medicament = map['id_medicament'];
    this._reliquat = map['reliquat'];
    this._qte_consomme = map['qte_consomme'];
    this._stabilite = map['stabilite'];
    this._prix_reliquat = map['prix_reliquat'];
    this._etat = map['etat'];
    this._FKDatePre = map['FKDatePre'];
    this._FKmedId = map['FKmedId'];
    this._FKmedId2 = map['FKmedId2'];
    this._id_solution = map['id_solution'];
    this._date_preparation = map['date_preparation'];
    this._posologie = map['posologie'];
    this._reduction = map['reduction'];
    this._dose_administrer = map['dose_administrer'];
    this._volume_finale = map['volume_finale'];

    this._FKpoche = map['FKpoche'];
    this._FKpatientId = map['FKpatientId'];
  }
}
