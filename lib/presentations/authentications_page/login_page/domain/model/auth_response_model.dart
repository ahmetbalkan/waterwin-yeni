import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';

@Entity(tableName: 'userdata')
class AuthResponseModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? token;
  String? refreshToken;
  int? userId; // UserModel'in id'si
  @ignore
  InformationModel? information;

  AuthResponseModel({
    this.id,
    this.token,
    this.refreshToken,
    this.userId,
    this.information,
  });

  // JSON'dan LoginResponseModel'e çevirme
  AuthResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    userId = json['user_id'];
    information = json['information'] != null
        ? InformationModel.fromJson(json['information'])
        : null;
  }

  // LoginResponseModel'den JSON'a çevirme
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    data['user_id'] = userId;
    if (information != null) {
      data['information'] = information!.toJson();
    }
    return data;
  }

  @override
  String toString() =>
      'LoginResponseModel(id: $id, token: $token, refreshToken: $refreshToken,  userId: $userId, information: $information)';
}
