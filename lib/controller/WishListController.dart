import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/model/WishlistModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:get/get.dart';

class WishListController extends GetxController implements GetxService {

  addTowishlist(propertyId) async {
    var response = await httpPost(Config.addtowishlist, {"property_id": "$propertyId"});
    try{
      WishlistModel wishlistModel=WishlistModel.fromJson(response);
      if (wishlistModel.status == 200) {
        showToastMessage(wishlistModel.message);
        return true;
      } else {
        showToastMessage(wishlistModel.error);
        return false;
      }
    }catch(e){
      return false;
    }
  }

  removeToWishlist(propertyId) async {
    var response = await httpPost(Config.removeToWishlist, {"property_id": "$propertyId",});
    try{
      WishlistModel wishlistModel=WishlistModel.fromJson(response);
      if (wishlistModel.status == 200) {
        showToastMessage(wishlistModel.message);
        return true;
      } else {
        showToastMessage(wishlistModel.error);
        return false;
      }
    }catch(e){
      return false;
    }
  }
}





