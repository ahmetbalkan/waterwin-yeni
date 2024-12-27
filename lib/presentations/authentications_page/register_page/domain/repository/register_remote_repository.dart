import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:waterwin_app/core/network/api_base_response.dart';
import 'package:waterwin_app/core/network/api_helper.dart';
import 'package:waterwin_app/core/network/app_exception.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/model/auth_response_model.dart';
import 'package:waterwin_app/presentations/authentications_page/login_page/domain/repositories/local/login_local_repository.dart';
import 'package:waterwin_app/presentations/authentications_page/register_page/data/remote/register_data_source.dart';

@injectable
class RegisterRepository {
  final RegisterDataSource _registerDataSource;
  final LoginLocalRepository _loginLocalRepository;

  RegisterRepository(
    this._registerDataSource,
    this._loginLocalRepository,
  );

  Future<Either<AppException, ApiResponse<AuthResponseModel>>> register({
    required String email,
    required String password,
  }) async {
    // API çağrısını gerçekleştirin
    final result = await ApiHelper.handleApiCall(
      _registerDataSource.register(email, password),
    );

    // Eğer başarılı bir yanıt dönerse, veriyi locale kaydedin
    return result.fold(
      (exception) => Left(exception), // Hata durumunda hatayı döndür
      (apiResponse) async {
        // Eğer başarı durumuysa ve veri geldiyse, kaydet
        if (apiResponse.data != null) {
          await _loginLocalRepository.insertAuthData(apiResponse.data!);
        }
        return Right(apiResponse); // Başarılı durumu döndür
      },
    );
  }
}
