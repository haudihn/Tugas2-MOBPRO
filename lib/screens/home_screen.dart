import 'package:flutter/material.dart';
import '../models/transaction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceHidden = false;
  int _selectedIndex = 0; // untuk navbar

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Transfer', '-Rp450.000', 'Transfer'),
      TransactionModel('Pembayaran Asuransi', '-Rp300.000', 'Kesehatan'),
      TransactionModel('Pulsa', '-Rp100.000', 'Pulsa/Data'),
      TransactionModel('Top Up', '-Rp250.000', 'Top Up'),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 237, 249),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Header =====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang,",
                        style: TextStyle(
                            color: Color.fromARGB(255, 55, 55, 55),
                            fontSize: 14),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "Haudi Agusti Hauzinabila",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ===== Kotak Gabungan: Saldo + Transaksi Lain =====
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    // ===== Saldo Utama =====
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 0, 191),
                            Color.fromARGB(255, 191, 0, 255)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Saldo Utama",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isBalanceHidden = !_isBalanceHidden;
                                  });
                                },
                                icon: Icon(
                                  _isBalanceHidden
                                      ? Icons.visibility_off_rounded
                                      : Icons.visibility_rounded,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isBalanceHidden
                                ? "Rp •••••••"
                                : "Rp 20.500.000",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "**** 280804",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                              Text(
                                "Great Bank",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ===== Transaksi Lain =====
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 18),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Transaksi lain",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              _CategoryItem(
                                icon: Icons.account_balance_rounded,
                                label: "Transfer",
                                iconColor: Color(0xFFE91E63),
                              ),
                              _CategoryItem(
                                icon: Icons.health_and_safety_rounded,
                                label: "Kesehatan",
                                iconColor: Color(0xFF4CAF50),
                              ),
                              _CategoryItem(
                                icon: Icons.account_balance_wallet,
                                label: "Top Up",
                                iconColor: Color(0xFFFF9800),
                              ),
                              _CategoryItem(
                                icon: Icons.phonelink_ring_rounded,
                                label: "Pulsa/Data",
                                iconColor: Color(0xFF2196F3),
                              ),
                              _CategoryItem(
                                icon: Icons.history_rounded,
                                label: "Riwayat",
                                iconColor: Color.fromARGB(255, 191, 0, 201),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== Transaksi Berhasil =====
              const Text(
                "Transaksi Berhasil",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const SizedBox(height: 8),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  final iconData = _getIconForCategory(tx.category);
                  final iconColor = _getColorForCategory(tx.category);

                  // 🔹 Tentukan tanggal berdasarkan kategori
                  final txDate = (tx.category.toLowerCase() == 'pulsa/data' ||
                          tx.category.toLowerCase() == 'top up')
                      ? "01 Nov 2025"
                      : "02 Nov 2025";

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: iconColor.withOpacity(0.15),
                              child: Icon(iconData, color: iconColor),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  txDate,
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          tx.amount,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // ===== NAVBAR BAWAH =====
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFE91E63),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  // ===== Fungsi Helper =====
  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'transfer':
        return Icons.account_balance_rounded;
      case 'kesehatan':
        return Icons.health_and_safety_rounded;
      case 'pulsa/data':
        return Icons.phonelink_ring_rounded;
      case 'top up':
        return Icons.account_balance_wallet_rounded;
      default:
        return Icons.receipt_long_rounded;
    }
  }

  Color _getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'transfer':
        return const Color(0xFFE91E63);
      case 'kesehatan':
        return const Color(0xFF4CAF50);
      case 'pulsa/data':
        return const Color(0xFF2196F3);
      case 'top up':
        return const Color(0xFFFF9800);
      default:
        return const Color(0xFF9E9E9E);
    }
  }
}

// ===== Widget Kategori =====
class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: iconColor),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }
}
