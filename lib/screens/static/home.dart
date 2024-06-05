import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funica_mobile/bloc/cart/cart_cubit.dart';
import 'package:funica_mobile/bloc/client/client_cubit.dart';
import 'package:funica_mobile/bloc/favorite/products_cubit.dart';
import 'package:funica_mobile/favorites/favorites.dart';
import 'package:funica_mobile/model/home_products_model.dart';
import 'package:funica_mobile/screens/product/sofa.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:funica_mobile/model/product_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grock/grock.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/locazilations.dart';
import '../../model/product_card.dart';
import '../../widgets/bottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //sepet beyni
  late CartCubit cartCubit;
  late ClientCubit clientCubit;
  late ProductsCubit productsCubit;

  @override
  void initState() {
    super.initState();
    cartCubit = context.read<CartCubit>();
    clientCubit = context.read<ClientCubit>();
    productsCubit = context.read<ProductsCubit>();
  }

  //slider
  final List<String> images = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
    'assets/images/slider4.png',
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final HomeProductsModel model = HomeProductsModel(
        categoryTitle: "Most Popular", products: mostPopular.products);
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[1000]
            : Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/' +
                (Theme.of(context).brightness == Brightness.dark
                    ? 'logo_white.png'
                    : 'logo.png')),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate("Good Morning"),
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black54,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.waving_hand,
                  size: 20,
                  color: Colors.amber,
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Eva Holt',
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on_outlined, size: 20.0),
            onPressed: () async {
              var status = await Permission.location.status;
              if (!status.isGranted) {
                var result = await Permission.location.request();
                if (result == PermissionStatus.granted) {
                  // Konum izni alındı, burada yapılacak işlemler
                  // Örneğin, bildirimler sayfasına yönlendirme
                  // Navigator.push(...)
                } else if (result == PermissionStatus.denied) {
                  // Kullanıcı izni reddetti, gerekirse kullanıcıyı yönlendir
                } else if (result == PermissionStatus.permanentlyDenied) {
                  // Kullanıcı izni kalıcı olarak reddetti, gerekirse ayarlara yönlendir
                  openAppSettings();
                }
              } else {
                // Konum izni zaten var, burada yapılacak işlemler
                // Örneğin, bildirimler sayfasına yönlendirme
                // Navigator.push(...)
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite_border_outlined, size: 20.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()),
              );
              // Favoriler sayfasına yönlendirme
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 52,
                child: TextField(
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black45,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.dark
                        ? Color.fromARGB(255, 50, 50, 50)
                        : Color.fromARGB(255, 244, 243, 243),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black26,
                    ),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Color.fromARGB(255, 244, 243, 243)
                            : Color.fromARGB(255, 50, 50, 50),
                    suffixIcon: Icon(
                      Icons.tune,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).getTranslate("Spesiyal"),
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context).getTranslate("Hepsini Gör"),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 155,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((url) {
                      int index = images.indexOf(url);
                      return Container(
                        width: 3.0,
                        height: 3.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Gap(15),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/sofa');
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black54
                                  : Color.fromARGB(255, 238, 238, 238),
                              child: Icon(
                                Icons.chair_outlined,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Gap(3),
                            Text(
                              AppLocalizations.of(context).getTranslate("Koltuk"),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/chair');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  Icons.chair_alt,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                  AppLocalizations.of(context).getTranslate("Sandalye"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/table');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  Icons.table_bar_outlined,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                  AppLocalizations.of(context).getTranslate("Masa"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/kitchen');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  Icons.kitchen_outlined,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                AppLocalizations.of(context).getTranslate("Mutfak"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/lamp');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  Icons.light,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                AppLocalizations.of(context).getTranslate("Işık"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/cupboard');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  Icons.shelves,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                AppLocalizations.of(context).getTranslate("Raflık"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/vase');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Color.fromARGB(255, 238, 238, 238),
                                child: Icon(
                                  Icons.local_florist_outlined,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                AppLocalizations.of(context).getTranslate("Vazo"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                        Gap(35),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/others');
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black54
                                    : Colors.white,
                                child: Icon(
                                  Icons.pending_outlined,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Gap(3),
                              Text(
                                AppLocalizations.of(context).getTranslate("Diğer"),
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold, fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Gap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).getTranslate("Popüler"),
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context).getTranslate("Hepsini Gör"),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            productsContainer(context),
            Gap(15),
            homeProductCategories(model),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GoRouter.of(context).go('/chat');
        },
        child: Icon(
          Icons.sms_outlined,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 21, 54, 81),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

Widget homeProductCategories(HomeProductsModel model) {
  return GridView.count( // GridView oluşturuyoruz
    shrinkWrap: true, // Gridview'i içindeki elemanlar kadar sarmasını sağlar
    crossAxisCount: 2, // Gridview'in kaç sütundan oluşacağını belirtir
    childAspectRatio: 0.8, // Her bir elemanın boyutunu ayarlar
    children: List.generate( // Ürün kartlarını oluşturmak için liste elemanlarını döngüyle gezerek ProductCard widget'ını üretir
      model.products.length, // Ürün sayısı kadar döngü yapar
      (index) {
        return ProductCard( // Her bir ürün için ProductCard widget'ı oluşturur
          functionOnTapFavorite: () { // Favoriye ekleme/çıkarma işlemi
            Map<String, dynamic> productMap = { // Ürün bilgilerini bir haritada saklar
              "id": model.products[index].id,
              "name": model.products[index].name,
              "photo": model.products[index].photo,
              "icon": model.products[index].icon,
              "price": model.products[index].price,
              "puan": model.products[index].puan,
              "tire": model.products[index].tire,
              "sold": model.products[index].sold,
              "descTitle": model.products[index].descTitle,
              "descDetail": model.products[index].descDetail,
              "colors": model.products[index].colors,
              "isFavorite": model.products[index].isFavorite,
            };
            if (model.products[index].isFavorite == false) { // Eğer ürün favori değilse
              model.products[index].isFavorite = true; // Ürünü favorilere ekle
              productsCubit.addToFavorites(productMap); // Favorilere ekleme işlemini gerçekleştir
            } else if (model.products[index].isFavorite == true) { // Eğer ürün favoride ise
              model.products[index].isFavorite = false; // Ürünü favorilerden çıkar
              productsCubit.removeFromFavorites(model.products[index].id); // Favorilerden çıkarma işlemini gerçekleştir
            }

            setState(() {}); // Değişikliklerin UI'ye yansıtılması için setState() çağırılır
          },
          product: model.products[index], // ProductCard'a gösterilecek ürün bilgileri verilir
          onTap: () { // Ürün kartına tıklama işlemi
            cartCubit.sepeteEkle( // Sepete ürün eklemek için cartCubit kullanılır
              id: model.products[index].id,
              ad: model.products[index].name,
              sayi: 1,
              fiyat: model.products[index].price,
              gorsel: model.products[index].photo,
            );
          },
        );
      },
    ),
  );
}





  Padding productsContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/others');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black
                        : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Hepsi"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/sofa');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Koltuk"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/chair');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Sandalye"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/table');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Masa"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/kitchen');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Mutfak"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/lamp');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Işık"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/cupboard');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Raflık"),
                    style: GoogleFonts.poppins(
                        fontSize: 9,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
            InkWell(
              onTap: () {
                GoRouter.of(context).go('/vase');
              },
              child: Container(
                width: 75,
                height: 35,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate("Vazo"),
                    style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
