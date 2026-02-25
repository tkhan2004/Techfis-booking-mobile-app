import 'package:flutter/material.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/add_card_text_field.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/card_swiper_widget.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Add New Card'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: ButtonText(text: 'Save & Continue', onPressed: () {}),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 184,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CardSwiper(
                listCard: [
                  "assets/images/primary_card.png",
                  "assets/images/sub1_card.png",
                  "assets/images/sub2_card.png",
                ],
              ),
            ),
            const SizedBox(height: 24),
            AddCardTextFlield(
              label: 'Cardholder Name',
              placeholder: 'Enter your cardholder name',
            ),
            AddCardTextFlield(
              label: 'Card Number',
              placeholder: 'Enter your card number',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddCardTextFlield(
                  width: 160,
                  label: 'Expiry Date',
                  placeholder: 'MM/YY',
                ),
                AddCardTextFlield(width: 160, label: 'CVV', placeholder: '***'),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    checkColor: Colors.white,
                    activeColor: AppColors.primary,
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value ?? false;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Save this card securely for future bookings. Your information is encrypted and protected.',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
