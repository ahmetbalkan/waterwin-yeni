import 'package:injectable/injectable.dart';
import 'package:waterwin_app/presentations/point_page/data/local/points_dao.dart';
import 'package:waterwin_app/presentations/point_page/domain/model/point_model.dart';

@injectable
class PointLocalRepository {
  final PointDao _pointDao;

  PointLocalRepository(this._pointDao);

  Future<void> insertPoint(PointResponseModel point) async {
    await _pointDao.insertPoint(point); // Yeni kaydı ekle
  }

  Future<void> insertPoints(List<PointResponseModel> points) async {
    await _pointDao.clearAllPoints(); // Tüm kayıtları temizle
    await _pointDao.insertPoints(points); // Yeni kayıtları ekle
  }

  Future<void> clearAllPoints() async {
    await _pointDao.clearAllPoints(); // Tüm kayıtları temizle
  }
}
