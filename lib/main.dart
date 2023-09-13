import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'dart:math' as math;

void main() {
  runApp(CreditCardApp());
}

class CreditCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreditCardScreen(),
    );
  }
}

class CreditCardScreen extends StatelessWidget {
  final List<String> cardNumbers = [
    "**** **** **** 1234",
    "**** **** **** 5678",
    "**** **** **** 9012",
  ];

  final List<String> cardHolders = [
    "John Doe",
    "Jane Smith",
    "Alice Johnson",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      appBar: AppBar(
        title: const Text('Credit Cards'),
      ),
      body: Center(
        child: Swiper(
          itemCount: cardNumbers.length,
          layout: SwiperLayout.STACK,
          itemWidth: 300,
          itemHeight: 200,
          itemBuilder: (BuildContext context, int index) {
            return CreditCardWidget(
              cardNumber: cardNumbers[index],
              cardHolder: cardHolders[index],
            );
          },
        ),
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;

  CreditCardWidget({required this.cardNumber, required this.cardHolder});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardNumber,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Card Holder',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
            ),
            Text(
              cardHolder,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
