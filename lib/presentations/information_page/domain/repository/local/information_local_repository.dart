import 'package:injectable/injectable.dart';
import 'package:waterwin_app/presentations/information_page/data/data_source/local/information_dao.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';

@injectable
class InformationLocalRepository {
  final InformationDao _informationDao;

  InformationLocalRepository(this._informationDao);

  Future<void> insertInformation(InformationModel informationModel) async {
    final existingAuth = await _informationDao.getFirstInformation();

    if (existingAuth != null) {
      // AuthModel mevcutsa, güncelleme yap
      await _informationDao.updateInformation(informationModel);
    } else {
      // Mevcut değilse, ekleme yap
      await _informationDao.insertInformation(informationModel);
    }
  }

  Future<InformationModel?> getFirstInformation() {
    return _informationDao.getFirstInformation();
  }

  Future<void> clearInformationData() {
    return _informationDao.clearInformationData();
  }

  Future<void> updateInformation(InformationModel informationModel) {
    return _informationDao.updateInformation(informationModel);
  }
}
