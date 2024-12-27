import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';

@dao
abstract class AuthDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAuth(AuthResponseModel loginResponseModel);

  @Query('SELECT * FROM userdata LIMIT 1')
  Future<AuthResponseModel?> getFirstAuth();

  @Query('DELETE FROM userdata')
  Future<void> clearAuthData();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateAuth(AuthResponseModel loginResponseModel);
}
