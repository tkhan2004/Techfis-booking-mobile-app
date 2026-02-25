import 'dart:core';

import 'package:faker/faker.dart';
import 'package:hotel_booking/domain/entities/hotel_entity.dart';

class MockRoomService {
  final _faker = Faker();

  // Hàm tạo ra 1 khách sạn ngẫu nhiên
  HotelEntity generateHotel() {
    return HotelEntity(
      id: _faker.guid.guid(), // Tạo ID duy nhất
      name:
          "${_faker.address.city()} ${_faker.randomGenerator.element(['Resort', 'Hotel', 'Villa', 'Spa'])}",
      location: "${_faker.address.streetAddress()}, ${_faker.address.city()}",

      // Dùng ảnh tạm từ Unsplash dựa trên từ khóa 'hotel'
      image:
          "https://loremflickr.com/320/240/hotel?lock=${_faker.randomGenerator.integer(100)}",
      price: roundDouble(
        _faker.randomGenerator.decimal(min: 50, scale: 0),
        2,
      ), // Giá từ 50 - 450$
      rating: roundDouble(
        _faker.randomGenerator.decimal(min: 3, scale: 0),
        1,
      ), // Rating từ 3.0 - 5.0
      reviews: _faker.randomGenerator.integer(1000).toString(),
      description: _faker.lorem.sentences(3).join(' '),
      date: _faker.date.dateTime(),
      time: _faker.date.dateTime(),
    );
  }

  double roundDouble(double value, int places) {
    return double.parse(value.toStringAsFixed(places));
  }

  // Hàm tạo ra danh sách 10 khách sạn (Lazy load cho Home)
  List<HotelEntity> generateList(int count) {
    print(count);
    return List.generate(count, (index) => generateHotel());
  }
}
