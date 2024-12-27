import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/information_page/domain/model/information_model.dart';

@dao
abstract class InformationDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertInformation(InformationModel loginResponseModel);

  @Query('SELECT * FROM information LIMIT 1')
  Future<InformationModel?> getFirstInformation();

  @Query('DELETE FROM information')
  Future<void> clearInformationData();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateInformation(InformationModel informationModel);

  @Query('SELECT * FROM information LIMIT 1')
  Stream<InformationModel?> watchInformation();
}
