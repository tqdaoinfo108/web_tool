import 'package:get/get.dart';
import 'package:gvb_charge/model/booking_detail_model.dart';
import 'package:gvb_charge/model/parking_model.dart';

import '../model/response_base.dart';
import '../model/user_model.dart';
import '../share/constant.dart';

class HttpClient extends GetConnect {
  static HttpClient get init => HttpClient();

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'http://apichargingsystems.gvbsoft.vn/';
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] =
          'Basic VXNlckNoYXJnaW5nU3lzdGVtc0FQOlBhc3NDaGFyZ2luZ1N5c3RlbUFQV29yZA==';
      return request;
    });
    httpClient.timeout = const Duration(seconds: 15);
    httpClient.maxRedirects = 3;
    super.onInit();
  }

  Future<Response<ResponseBase<UserModel>>> postLogin(
          String userName, String pasword) =>
      post("api/user/login", {"Email": userName, "PassWord": pasword},
          decoder: UserModel.getUserResponse);

  Future<Response<ResponseBase<UserModel>>> getProfile() =>
      get("api/user/profile?userID=${UserModel.getUSerID}",
          decoder: UserModel.getUserResponse);

  Future<Response<ResponseBase<List<ParkingModel>>>> getListPark(
          String keySearch, int page, int limit, {double? lat, double? lng}) =>
      get("api/parkinglot/get?keySearch=$keySearch&page=$page&limit=$limit&Latitude=${lat ?? 0}&Longitude=${lng ?? 0}",
          decoder: ParkingModel.getListParkingResponse);

  Future<Response<ResponseBase<List<BookingDetail>>>> getListBook(
          int status, int page) =>
      get("api/booking/gethistorybooking",
          query: {
            "userID": UserModel.getUSerID,
            "status": status,
            "page": page,
            "limit": maxPageLimit
          },
          decoder: BookingDetail.getListBookingDetailResponse);
}
