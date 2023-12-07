import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressUser {
  final String idAddress,name, address, city, state, zipCode, country,idUser;
   bool isChoose;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  final DateTime createOn;


  factory AddressUser.fromJson(Map<String, dynamic> json) =>
      _$AddressUserFromJson(json);
  static DateTime _dateTimeAsIs(DateTime dateTime) => dateTime;
  AddressUser(this.name, this.address, this.city, this.state, this.zipCode, this.country, this.idUser, this.isChoose, this.createOn, this.idAddress);
  static DateTime _dateTimeFromTimestamp(Timestamp timestamp) {
    return DateTime.parse(timestamp.toDate().toString());
  }
  Map<String, dynamic> toJson() => _$AddressUserToJson(this);
}
