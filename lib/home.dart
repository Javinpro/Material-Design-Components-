import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSidebarVisible = false;

  // Mengubah daftar items agar sesuai dengan nama mobil, deskripsi, dan harga
  final List<Map<String, String>> items = [
    {
      'name': 'LB-E-WORKS TESLA Model 3',
      'description': 'LB-E-WORKS',
      'image': 'assets/mobil 1.jpg',
      'price': '\$2000',
    },
    {
      'name': 'LB-WORKS F8 Tributo',
      'description': 'LB-WORKS',
      'image': 'assets/mobil 2.jpg',
      'price': '\$5000',
    },
    {
      'name': 'LB-WORKS Countach',
      'description': 'LB-WORKS',
      'image': 'assets/mobil 3.jpg',
      'price': '\$4000',
    },
    {
      'name': 'LB-WORKS Ferrari F40',
      'description': 'LB-WORKS',
      'image': 'assets/mobil 4.jpg',
      'price': '\$3500',
    },
    {
      'name': 'LB-Silhouette WORKS MURCIELAGO GT Evo',
      'description': 'LB-Silhouette WORKS',
      'image': 'assets/mobil 5.jpg',
      'price': '\$8000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF000000),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Burger Menu
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xffffffff),
              ),
              onPressed: () {
                setState(() {
                  isSidebarVisible = !isSidebarVisible;
                });
              },
            ),
            // Title di tengah
            const Expanded(
              child: Center(
                child: Text(
                  'Home Page',
                  style: TextStyle(
                    color: Color(0xFFffffff),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            // Ikon tambahan
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xffffffff),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.sort,
                    color: Color(0xffffffff),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailPage(item: item),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.zero,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['name']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['description']!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['price']!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  final Map<String, String> item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0xffffffff),
        title: Text(item['name']!),
        backgroundColor: Color(0xff000000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                item['image']!,
                width: 500,
                height: 500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              item['name']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              item['description']!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: ${item['price']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
