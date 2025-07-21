import "package:flutter_test/flutter_test.dart";
import "package:genshin_material/core/hoyolab_api.dart";

void main() {
  test("ApiRateLimiter", () async {
    final limiter = ApiRequestQueue(
      interval: Duration(milliseconds: 200),
    );

    final start = DateTime.now();
    await limiter.run(() => 1);
    expect(DateTime.now().difference(start), lessThan(Duration(milliseconds: 10)));

    await limiter.run(() => 2);
    expect(DateTime.now().difference(start), greaterThanOrEqualTo(Duration(milliseconds: 200)));

    await limiter.run(() => 3);
    expect(DateTime.now().difference(start), greaterThanOrEqualTo(Duration(milliseconds: 400)));

    await limiter.run(() => Future.delayed(Duration(milliseconds: 100)));
    await limiter.run(() => Future.delayed(Duration(milliseconds: 100)));
    await limiter.run(() => Future.delayed(Duration(milliseconds: 100)));
    expect(DateTime.now().difference(start), greaterThanOrEqualTo(Duration(milliseconds: 1100)));
  });
}
