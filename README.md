APLIKASI E-COMMERCE SEDERHANA MENGGUNAKAN FLUTTER

-----


# 🛒Aplikasi E-Commerce Flutter Sederhana

## 👀 Tampilan aplikasi

### Halaman Login
![Halaman Login Aplikasi](https://github.com/Panca955/uts_panca_mpl/blob/main/ssan/Screenshot%20(188).png)

### Katalog Produk
![Katalog Produk Aplikasi](https://github.com/Panca955/uts_panca_mpl/blob/main/ssan/Screenshot%20(190).png)
### Detail Produk
![Detail Produk Aplikasi](https://github.com/Panca955/uts_panca_mpl/blob/main/ssan/Screenshot%20(191).png)
### Keranjang Belanja
![Keranjang Belanja Aplikasi](https://github.com/Panca955/uts_panca_mpl/blob/main/ssan/Screenshot%20(193).png)

## ✨ Fitur Utama

* **Autentikasi Pengguna:** Login sederhana menggunakan API dummy.
* **Katalog Produk:** Menampilkan daftar produk yang menarik dalam layout grid yang responsif.
* **Detail Produk:** Halaman detail untuk setiap produk dengan informasi lengkap.
* **Keranjang Belanja:** Fungsionalitas keranjang untuk menambah, mengurangi kuantitas, dan menghapus item.
* **Manajemen State:** Menggunakan package `provider` untuk mengelola state aplikasi secara efisien, terutama untuk keranjang belanja.
* **Integrasi API:** Berinteraksi dengan `dummyjson.com` untuk data autentikasi dan produk.
* **Navigasi:** Pengelolaan navigasi antar halaman yang mulus.
* **Desain UI Menarik:** Implementasi Material Design dengan tema kustom.

## 🚀 Teknologi yang Digunakan

* **Flutter SDK:** Versi 3.114.0
* **Dart SDK:** Versi 3.114.2
* **Package Eksternal:**
    * [`http`](https://pub.dev/packages/http): Untuk melakukan permintaan HTTP (GET, POST) ke API eksternal.
    * [`provider`](https://pub.dev/packages/provider): Solusi manajemen state yang populer dan mudah digunakan di Flutter.

## 📁 Struktur Proyek

Proyek ini terorganisir dengan baik untuk pemisahan perhatian yang jelas:

```

.
├── lib/
│   ├── models/           \# Definisi model data (Product, CartItem)
│   │   ├── product.dart
│   │   └── cart\_item.dart
│   ├── pages/            \# Halaman-halaman UI aplikasi
│   │   ├── login\_page.dart
│   │   ├── home\_page.dart
│   │   ├── detail\_page.dart
│   │   └── cart\_page.dart
│   ├── services/         \# Logika bisnis dan interaksi API
│   │   ├── api\_service.dart
│   │   └── cart\_service.dart
│   └── main.dart         \# Titik masuk utama aplikasi
├── pubspec.yaml          \# Dependensi proyek dan metadata
└── README.md             \# Dokumentasi proyek

````

## 🛠️ Instalasi dan Cara Menjalankan Aplikasi

Ikuti langkah-langkah di bawah ini untuk menginstal dan menjalankan aplikasi ini di lingkungan pengembangan Anda.

### Prasyarat

* [Flutter SDK](https://flutter.dev/docs/get-started/install) terinstal di komputer Anda.
* Editor kode (misalnya, [VS Code](https://code.visualstudio.com/) dengan ekstensi Flutter/Dart, atau [Android Studio](https://developer.android.com/studio)).
* Perangkat virtual (emulator/simulator) atau perangkat fisik Android/iOS yang terhubung.

### Langkah-langkah Instalasi

1.  **Clone Repository:**
    ```bash
    git clone [https://github.com/your-username/flutter-ecommerce-app-tutorial.git](https://github.com/your-username/flutter-ecommerce-app-tutorial.git)
    cd flutter-ecommerce-app-tutorial
    ```
    *(Ganti `your-username` dengan username GitHub Anda.)*

2.  **Install Dependensi:**
    ```bash
    flutter pub get
    ```
    Perintah ini akan mengunduh semua package yang diperlukan yang terdaftar di `pubspec.yaml`.

3.  **Jalankan Aplikasi:**
    Pastikan emulator/simulator Anda berjalan atau perangkat fisik Anda terhubung.
    ```bash
    flutter run
    ```
    Aplikasi akan ter-deploy ke perangkat target Anda.

## 👨‍💻 Penggunaan Aplikasi

### Login
* Aplikasi akan memulai di halaman login.
* Anda dapat menggunakan kredensial dummy dari `dummyjson.com` untuk login:
    * **Username:** `emilys`
    * **Password:** `emilyspass`
* Klik tombol "Login" untuk masuk ke halaman katalog produk.

### Katalog Produk (Home Page)
* Setelah login, Anda akan melihat daftar produk yang ditampilkan dalam layout grid (4 kolom).
* Anda dapat menggulir untuk melihat lebih banyak produk.
* Setiap kartu produk menampilkan gambar, judul, dan harga.

### Detail Produk
* Klik pada salah satu produk di katalog untuk melihat detail lengkapnya.
* Halaman detail akan menampilkan gambar lebih besar, judul, harga, dan deskripsi produk.
* Terdapat tombol "Tambah ke Keranjang" untuk menambahkan produk ke keranjang belanja Anda.

### Keranjang Belanja (Cart Page)
* Dari halaman katalog produk (Home Page), klik ikon keranjang belanja di `AppBar` (pojok kanan atas) untuk melihat item di keranjang Anda.
* Di halaman keranjang, Anda dapat:
    * Melihat daftar item yang telah ditambahkan.
    * Mengubah kuantitas item menggunakan tombol `+` dan `-`.
    * Menghapus item dari keranjang menggunakan ikon tempat sampah.
    * Melihat total harga semua item di keranjang.
    * Klik tombol "Checkout" (saat ini hanya akan menampilkan notifikasi dan mengosongkan keranjang).

## 💡 Konsep Penting dalam Kode

### `main.dart` - Pengaturan Global & Provider
```dart
// lib/main.dart
// ...
return ChangeNotifierProvider(
  create: (context) => CartService(), // Membuat instance CartService tersedia secara global
  child: MaterialApp(
    // ...
    home: const LoginPage(),
  ),
);
````

  * `ChangeNotifierProvider` membungkus seluruh aplikasi, membuat `CartService` dapat diakses oleh semua widget turunan untuk manajemen keranjang belanja terpusat.

### `api_service.dart` - Komunikasi API

```dart
// lib/services/api_service.dart
// ...
static Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse('[https://dummyjson.com/products](https://dummyjson.com/products)'));
  if (response.statusCode == 200) {
    List products = jsonDecode(response.body)['products'];
    return products.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Gagal memuat produk');
  }
}
// ...
```

  * Fungsi-fungsi statis di sini bertanggung jawab untuk mengambil data dari REST API. Respons JSON di-parsing menjadi objek Dart (`Product`) menggunakan `Product.fromJson()` factory constructor.

### `product.dart` & `cart_item.dart` - Struktur Data

```dart
// lib/models/product.dart
class Product {
  // ... properti
  factory Product.fromJson(Map<String, dynamic> json) {
    // ... parsing JSON
  }
}
```

```dart
// lib/models/cart_item.dart
class CartItem {
  final Product product;
  int quantity;
  // ... metode increment/decrement
}
```

  * Model ini memastikan data kita terstruktur dengan baik dan mudah dimanipulasi di dalam aplikasi.

### `cart_service.dart` - Logika Keranjang Belanja

```dart
// lib/services/cart_service.dart
// ...
class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];
  // ... metode addToCart, removeFromCart, increaseQuantity, decreaseQuantity, getTotalPrice, getTotalItems, clearCart
  // ...
  void addToCart(Product product) { /* ... logic ... */ notifyListeners(); }
}
```

  * `CartService` adalah `ChangeNotifier` yang memegang daftar item keranjang. Setiap perubahan pada daftar ini akan memanggil `notifyListeners()` untuk memberi tahu UI agar diperbarui.

### `home_page.dart` - Tampilan Grid Produk

```dart
// lib/pages/home_page.dart
// ...
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 4, // Jumlah kolom
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 0.95, // Rasio lebar/tinggi kartu
  ),
  itemBuilder: (context, index) {
    // ... Kartu Produk dengan Expanded dan Hero animation
    child: Column(
      children: [
        Expanded(flex: 4, child: Hero(...)), // Gambar
        Expanded(flex: 2, child: Padding(...)) // Teks (judul & harga)
      ],
    )
  }
);
// ...
```

  * Menggunakan `GridView.builder` untuk menampilkan produk dalam tata letak yang efisien.
  * `crossAxisCount: 4` mengatur empat produk per baris.
  * `childAspectRatio` mengontrol rasio lebar/tinggi setiap kartu produk.
  * `Expanded` dengan `flex` digunakan untuk membagi ruang vertikal antara gambar dan detail teks, memastikan elemen-elemen proporsional.
  * `Hero` widget memberikan transisi visual yang halus saat menavigasi ke halaman detail produk.
  * `mainAxisAlignment: MainAxisAlignment.end` pada `Column` teks memastikan harga berada di bagian bawah kartu.

### `detail_page.dart` - Menambah ke Keranjang

```dart
// lib/pages/detail_page.dart
// ...
ElevatedButton(
  onPressed: () {
    Provider.of<CartService>(context, listen: false).addToCart(productDetail);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${productDetail.title} ditambahkan ke keranjang!')),
    );
  },
  child: const Text('Tambah ke Keranjang'),
)
// ...
```

  * Tombol "Tambah ke Keranjang" mengakses instance `CartService` melalui `Provider` (dengan `listen: false` karena kita hanya ingin memicu perubahan, bukan membangun ulang UI) dan menambahkan produk yang sedang dilihat.

### `cart_page.dart` - Interaksi Keranjang

```dart
// lib/pages/cart_page.dart
// ...
Consumer<CartService>(
  builder: (context, cartService, child) {
    if (cartService.items.isEmpty) { /* ... UI keranjang kosong ... */ }
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final cartItem = cartService.items[index];
              return Card(
                // ... tombol +/- kuantitas dan hapus item, memanggil metode CartService
              );
            }
          )
        ),
        Container(
          // ... total harga dan tombol Checkout
          child: Text('\$${cartService.getTotalPrice().toStringAsFixed(2)}')
        )
      ],
    );
  }
)
// ...
```

  * `Consumer<CartService>` memungkinkan `CartPage` untuk secara otomatis memperbarui tampilannya setiap kali ada perubahan pada keranjang.
  * Setiap item di keranjang memiliki kontrol untuk mengubah kuantitas atau menghapus item, yang semuanya memanggil metode di `CartService`.
  * Total harga ditampilkan secara dinamis menggunakan `cartService.getTotalPrice()`.

## 🤝 Kontribusi

Merasa ingin berkontribusi? Anda dipersilakan untuk membuka `issue` atau mengajukan `pull request` di repositori ini.

## 📄 Lisensi

Proyek ini dilisensikan di bawah lisensi MIT. Lihat file `LICENSE` untuk detail lebih lanjut.

