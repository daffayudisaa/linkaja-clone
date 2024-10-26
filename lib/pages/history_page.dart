import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'Transaction History',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Done'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Isi konten untuk tab Pending
            PendingView(),
            // Isi konten untuk tab Done
            DoneView(),
          ],
        ),
      ),
    );
  }
}

class DoneView extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {
      'title': 'Pay Merchant',
      'balance': 'Rp 50.000',
      'time': '27 Sep 2024, 10:00 WIB',
      'description': 'Indomaret Purchase',
    },
    {
      'title': 'Top Up',
      'balance': 'Rp 100.000',
      'time': '24 Sep 2024, 18:00 WIB',
      'description': 'Top Up from BCA',
    },
    {
      'title': 'Transfer',
      'balance': 'Rp 200.000',
      'time': '24 Sep 2024, 14:00 WIB',
      'description': 'Transfer to BCA',
    },
    {
      'title': 'Pay Merchant',
      'balance': 'Rp 75.000',
      'time': '23 Sep 2024, 12:00 WIB',
      'description': 'Alfamart Purchase',
    },
    {
      'title': 'Pay Merchant',
      'balance': 'Rp 35.000',
      'time': '23 Sep 2024, 09:00 WIB',
      'description': 'Chikuro MOG',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction['title']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transaction['balance']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      transaction['time']!,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Success",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 4,
                          height: 20,
                          margin: EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Divider(color: Colors.grey.shade300, thickness: 1),
                SizedBox(height: 10),
                Text(
                  transaction['description']!,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PendingView extends StatelessWidget {
  const PendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/No-Transaction.png',
              width: 300,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'All transactions are completed!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Any pending transaction will appear on this page',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
