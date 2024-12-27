import 'package:floor/floor.dart';
import 'package:waterwin_app/presentations/home_page/domain/model/ad_local_model.dart';

@dao
abstract class AdDao {
  @Query('SELECT * FROM AdModel WHERE id = :id LIMIT 1')
  Future<AdModel?> getAdById(int id); // Reklamı ID ile getir

  @Query('SELECT * FROM AdModel ORDER BY lastSeenDate ASC LIMIT 1')
  Future<AdModel?> getNextAdToShow(); // En eski tarihe sahip reklamı getir

  @Query('SELECT * FROM AdModel')
  Future<List<AdModel>> getAllAds(); // Tüm reklamları getir

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAd(AdModel ad); // Reklam ekle

  @update
  Future<void> updateAd(AdModel ad); // Reklam güncelle
}
