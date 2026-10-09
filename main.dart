
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Қосымшаны іске қосу
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

// Тауар экраны
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Таңдаулы батырмасының күйі
  bool isFavorite = false;

  // Себеттегі тауар саны
  int cartCount = 0;

  // Таңдалған өлшем
  int selectedSize = 0;

  // Хиджаб өлшемдері
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Kaspi стиліндегі жоғарғы панель
      appBar: AppBar(
        backgroundColor: const Color(0xFFF14635),
        foregroundColor: Colors.white,
        title: const Text(
          'Kaspi.kz',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          // Себеттегі тауарлар санын көрсету
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Badge(
                isLabelVisible: cartCount > 0,
                label: Text('$cartCount'),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 27,
                ),
              ),
            ),
          ),
        ],
      ),

      // Негізгі экран
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Хиджаб суреті мен жүрек батырмасы
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4E9DE),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  // Өзіміз қосқан қоңыр хиджаб суреті
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/hijab_brown.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Таңдаулыға қосу батырмасы
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ),
                ),

                // Жаңа тауар белгісі
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF14635),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'ЖАҢА',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Тауар атауы
            const Text(
              'Misalem MS-010',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Гүл өрнекті қоңыр хиджаб',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 16),

            // Тауардың түсі
            Row(
              children: [
                const Text(
                  'Түсі: ',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Color(0xFF795548),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Қоңыр',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Өлшем таңдау
            const Text(
              'Өлшемді таңдаңыз',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Өлшемдер экранға сыймаса, келесі қатарға өтеді
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(sizes.length, (index) {
                return ChoiceChip(
                  label: Text(sizes[index]),
                  selected: selectedSize == index,
                  selectedColor: const Color(0xFFF14635),
                  labelStyle: TextStyle(
                    color: selectedSize == index
                        ? Colors.white
                        : Colors.black,
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedSize = index;
                    });
                  },
                );
              }),
            ),

            const SizedBox(height: 24),

            // Тауар туралы ақпарат
            const Text(
              'Тауар туралы',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Қоңыр түсті хиджаб нәзік гүл өрнектерімен '
              'безендірілген. Қоңыр түс пен гүлді оюлар '
              'бір-бірімен үйлесіп, әдемі әрі жинақы көрініс '
              'береді. Күнделікті киім үлгісіне жарасымды.',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Тауардың негізгі ерекшеліктері
            const Text(
              'Ерекшеліктері',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(label: Text('Қоңыр түс')),
                Chip(label: Text('Гүл өрнегі')),
                Chip(label: Text('Әйелдерге арналған')),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // Төменгі панель экранның төменгі жағында қалады
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.black12),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                size: 28,
              ),

              const SizedBox(width: 12),

              // Батырма бос кеңістікті толық алады
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cartCount++;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Хиджаб себетке қосылды!',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF14635),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Себетке қосу',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
