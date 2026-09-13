import "dart:convert";

/// A HoYoLAB envelope that carries no error, for tests whose subject is not the
/// payload.
final successResponse = jsonEncode({
  "retcode": 0,
  "message": "OK",
  "data": {"list": []},
});
