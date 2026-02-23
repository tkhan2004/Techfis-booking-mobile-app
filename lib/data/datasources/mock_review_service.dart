import 'dart:core';

import 'package:faker/faker.dart';
import 'package:hotel_booking/domain/entities/review_entity.dart';

class MockReviewService {
  final _faker = Faker();

  // Hàm tạo ra 1 khách sạn ngẫu nhiên
  ReviewEntity generateReview() {
    return ReviewEntity(
      id: _faker.guid.guid(), // Tạo ID duy nhất
      fullName:
          "${_faker.address.city()} ${_faker.randomGenerator.element(['Resort', 'Hotel', 'Villa', 'Spa'])}",
      image:
          "https://loremflickr.com/320/240/hotel?lock=${_faker.randomGenerator.integer(100)}",
      rating: _faker.randomGenerator.decimal(min: 50, scale: 0),
      date: _faker.date.dateTime(),
      content: _faker.lorem.sentence(),
    );
  }

  double roundDouble(double value, int places) {
    return double.parse(value.toStringAsFixed(places));
  }

  // Hàm tạo ra danh sách 10 khách sạn (Lazy load cho Home)
  List<ReviewEntity> generateList(int count) {
    print(count);
    return List.generate(count, (index) => generateReview());
  }
}
