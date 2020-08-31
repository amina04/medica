import 'package:flutter/material.dart';

class Patient {
  //les colones de table student
  int _id_patient;
  String _Nom_patient;
  String _Prenom_patient;
  int _taille;
  int _poids;
  double _surface_coporelle;

  //un constructeur pour remplir le table
  Patient(
    this._Nom_patient,
    this._Prenom_patient,
    this._taille,
    this._poids,
    this._surface_coporelle,
  );
  Patient.map(dynamic obj) {
    this._Nom_patient = obj['Nom_patient'];
    this._Prenom_patient = obj['Prenom_patient'];
    this._taille = obj['taille'];
    this._poids = obj['poids'];
    this._surface_coporelle = obj['surface_coporelle'];
    this._id_patient = obj['id_patient'];
  }

  //car les champs sont privée en met ca pour faciliter l acceder a eux
  int get id_patient => _id_patient;
  String get Nom_patient => _Nom_patient;
  String get Prenom_patient => _Prenom_patient;
  int get taille => _taille;
  int get poids => _poids;
  double get surface_coporelle => _surface_coporelle;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['Nom_patient'] = _Nom_patient;
    map['Prenom_patient'] = _Prenom_patient;
    map['taille'] = _taille;
    map['poids'] = _poids;
    map['surface_coporelle'] = _surface_coporelle;

    if (id_patient != null) {
      map['id_patient'] = _id_patient;
    }
    return map;
  }

  Patient.fromMap(Map<String, dynamic> map) {
    this._Nom_patient = map['Nom_patient'];
    this._Prenom_patient = map['Prenom_patient'];
    this._taille = map['taille'];
    this._poids = map['poids'];
    this._surface_coporelle = map['surface_coporelle'];
    this._id_patient = map['id_patient'];
  }
}
