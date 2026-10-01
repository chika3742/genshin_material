import "dart:convert";

/// A HoYoLAB envelope that carries no error, for tests whose subject is not the
/// payload.
final successResponse = jsonEncode({
  "retcode": 0,
  "message": "OK",
  "data": {"list": []},
});

/// The `sol/info` envelope behind `HoyolabAccountApi.loginBonusStatus`.
/// [today] is the server's check-in day in UTC+8, as `yyyy-MM-dd`.
String signInfoResponse({required bool isSign, required String today}) {
  return jsonEncode({
    "retcode": 0,
    "message": "OK",
    "data": {"is_sign": isSign, "today": today},
  });
}
