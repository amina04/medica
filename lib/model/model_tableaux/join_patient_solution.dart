import 'package:flutter/material.dart';

class Join_patient_solution {
  //les colones de table student
  int _id_patient;
  String _Nom_patient;
  String _Prenom_patient;
  int _taille;
  int _poids;
  double _surface_coporelle;
  int _id_solution;
  String _date_preparation;
  double _posologie;
  int _reduction;
  double _dose_administrer;
  double _volume_finale;
  //=====clé etrangers====
  int _FKmedId;
  int _FKpoche;
  int _FKpatientId;

  //un constructeur pour remplir le table
  Join_patient_solution(
      this._Nom_patient,
      this._Prenom_patient,
      this._taille,
      this._poids,
      this._surface_coporelle,
      this._date_preparation,
      this._posologie,
      this._reduction,
      this._dose_administrer,
      this._volume_finale,
      this._FKmedId,
      this._FKpoche,
      this._FKpatientId,
      );
  Join_patient_solution.map(dynamic obj) {
    this._Nom_patient = obj['Nom_patient'];
    this._Prenom_patient = obj['Prenom_patient'];
    this._taille = obj['taille'];
    this._poids = obj['poids'];
    this._surface_coporelle = obj['surface_coporelle'];
    this._id_patient = obj['id_patient'];
    this._id_solution = obj['id_solution'];
    this._date_preparation = obj['date_preparation'];
    this._posologie = obj['posologie'];
    this._reduction = obj['reduction'];
    this._dose_administrer = obj['dose_administrer'];
    this._volume_finale = obj['volume_finale'];
    this._FKmedId = obj['FKmedId'];
    this._FKpoche = obj['FKpoche'];
    this._FKpatientId = obj['FKpatientId'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_patient => _id_patient;
  String get Nom_patient => _Nom_patient;
  String get Prenom_patient => _Prenom_patient;
  int get taille => _taille;
  int get poids => _poids;
  double get surface_coporelle => _surface_coporelle;
  int get id_solution => _id_solution;
  String get date_preparation => _date_preparation;
  double get posologie => _posologie;
  int get reduction => _reduction;
  double get dose_administrer => _dose_administrer;
  double get volume_finale => _volume_finale;
  int get FKmedId => _FKmedId;
  int get FKpoche => _FKpoche;
  int get FKpatientId => _FKpatientId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['Nom_patient'] = _Nom_patient;
    map['Prenom_patient'] = _Prenom_patient;
    map['taille'] = _taille;
    map['poids'] = _poids;
    map['surface_coporelle'] = _surface_coporelle;
    map['date_preparation'] = _date_preparation;
    map['posologie'] = _posologie;
    map['reduction'] = _reduction;
    map['dose_administrer'] = _dose_administrer;
    map['volume_finale'] = _volume_finale;
    map['FKmedId'] = _FKmedId;
    map['FKpoche'] = _FKpoche;
    map['FKpatientId'] = _FKpatientId;
    if (id_solution != null) {
      map['id_solution'] = _id_solution;
    }

    if (id_patient != null) {
      map['id_patient'] = _id_patient;
    }
    return map;
  }

  Join_patient_solution.fromMap(Map<String, dynamic> map) {
    this._Nom_patient = map['Nom_patient'];
    this._Prenom_patient = map['Prenom_patient'];
    this._taille = map['taille'];
    this._poids = map['poids'];
    this._surface_coporelle = map['surface_coporelle'];
    this._id_patient = map['id_patient'];
    this._id_solution = map['id_solution'];
    this._date_preparation = map['date_preparation'];
    this._posologie = map['posologie'];
    this._reduction = map['reduction'];
    this._dose_administrer = map['dose_administrer'];
    this._volume_finale = map['volume_finale'];
    this._FKmedId = map['FKmedId'];
    this._FKpoche = map['FKpoche'];
    this._FKpatientId = map['FKpatientId'];
  }
}
//push