import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  User._();

  factory User({
    required String uid,
    String? fullname,
    String? email,
    String? phone,
    String? avatarUrl,
    String? address,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  factory User.empty() => User(
    uid: "",
    fullname: "",
    email: "",
    phone: "",
    avatarUrl: "",
    address: "",
  );

  bool get isEmpty => uid.isEmpty;
  bool get isProfileNotFinished => fullname?.isEmpty ?? true;
  bool contains(String val) =>
      (fullname ?? '').toLowerCase().contains(val.toLowerCase()) ||
          (email ?? '').toLowerCase().contains(val.toLowerCase()) ||
          (phone ?? '').toLowerCase().contains(val.toLowerCase());
  String getValueByField(String field) {
    if (field == 'fullname') {
      return fullname ?? '';
    } else if (field == 'phone') {
      return phone ?? '';
    } else if (field == 'email') {
      return email ?? '';
    }
    return '';
  }

  User nullableCopyWith({
    String? uid,
    String? fullname,
    String? email,
    String? phone,
    String? avatarUrl,
    String? address,
  }) {
    return User(
      uid: uid ?? this.uid,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      address: address ?? this.address,
    );
  }
}