import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funica_mobile/core/storage.dart';
import 'package:funica_mobile/model/credit_card.dart';
import 'package:funica_mobile/widgets/bottomNavigation.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentCard> cards = [];
  String cardNo = "";
  TextEditingController cardHolderCnt = TextEditingController();
  TextEditingController cvv2Cnt = TextEditingController();
  TextEditingController expYearCnt = TextEditingController();
  TextEditingController expMonthCnt = TextEditingController();
  TextEditingController titleCnt = TextEditingController();
  bool remember = false;
  String type = "";
  loadCards() async {
    final storage = Storage();
    var cards = await storage.loadCards();
    setState(() {
      this.cards = cards;
    });
  }

  saveCard() async {
    // kontrollari saglicaksiniz

    final PaymentCard newCard = PaymentCard(
      title: titleCnt.text,
      cardHolder: cardHolderCnt.text,
      cardNo: cardNo,
      cvv2: cvv2Cnt.text,
      expMonth: int.parse(expMonthCnt.text),
      expYear: int.parse(expYearCnt.text),
    );

    List<PaymentCard> yeniKartListesi = [];

    yeniKartListesi.addAll(cards);
    yeniKartListesi.addAll(cards);

    yeniKartListesi.add(newCard);

    if (remember) {
      final storage = Storage();
      await storage.saveCards(yeniKartListesi);
    }

    setState(() {
      cards = yeniKartListesi;
    });

    context.pop();

    setState(() {
      remember = false;
      cardNo = "";
      cardHolderCnt.text = "";
      expMonthCnt.text = "";
      expYearCnt.text = "";
      cvv2Cnt.text = "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  showAddCard() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Klavye açıkken ekranın yukarı kaymasını sağlar
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) { // StatefulBuilder, modal alt sayfadaki değişiklikleri güncellemek için gereklidir
          return SingleChildScrollView( // Küçük ekranlarda kaydırmayı sağlar
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, // Klavyenin açık olması durumunda alt kısmın görünmesini sağlar
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Minimum boyutta olmasını sağlar
                children: [
                  Text(
                    "Yeni Kart Tanımlama", // Başlık metni
                    style: Theme.of(context).textTheme.bodySmall, // Tema stili
                  ),
                  const SizedBox(height: 20), // Boşluk ekler
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Kart Başlığı",
                      labelText: "Kart Başlığı",
                    ),
                    controller: titleCnt, // Kart başlığı metni için kontrolcü atanır
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Ad Soyad",
                      labelText: "Ad Soyad",
                    ),
                    controller: cardHolderCnt, // Kart sahibi metni için kontrolcü atanır
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Kart No",
                      labelText: "Kart No",
                    ),
                    onChanged: (value) { // Kart numarası girildiğinde çalışır
                      setState(() { // State değiştirme
                        cardNo = value; // Kart numarasını günceller
                        if (value.startsWith("4")) { // Visa kartı
                          type = "visa";
                        } else if (value.startsWith("5")) { // Mastercard
                          type = "master";
                        } else if (value.startsWith("9") || // Troy kart
                            value.startsWith("6") ||
                            value.startsWith("3")) {
                          type = "troy";
                        } else {
                          type = ""; // Diğer durumlar için
                        }
                      });
                    },
                    keyboardType: TextInputType.number, // Sadece sayı girişi
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "CVV2",
                            labelText: "CVV2",
                          ),
                          obscureText: true, // Gizli metin (şifre)
                          controller: cvv2Cnt, // CVV2 kontrolcüsü
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Bitiş Ay",
                            labelText: "Bitiş Ay",
                          ),
                          controller: expMonthCnt, // Son kullanma ayı kontrolcüsü
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Bitiş Yıl",
                            labelText: "Bitiş Yıl",
                          ),
                          controller: expYearCnt, // Son kullanma yılı kontrolcüsü
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    title: Text("Kartı Kaydet"), // Anahtar metni
                    value: remember, // Anahtarın değeri
                    onChanged: (value) => setState(() => remember = value), // Anahtar değiştiğinde işlem
                  ),
                  if (type.isNotEmpty) ...[
                    SizedBox(height: 20), // Boşluk ekler
                    Image.asset( // Kart tipine göre görsel ekler
                      "assets/icons/${type}_card.png",
                      height: 60,
                      width: 100,
                    ),
                  ],
                  SizedBox(height: 20), // Boşluk ekler
                  ElevatedButton( // Onay düğmesi
                    onPressed: saveCard, // Onaylama fonksiyonu
                    child: Text("Onayla"), // Düğme metni
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: IconButton.outlined(
              onPressed: showAddCard, icon: const Icon(Icons.add)), // Yeni kart ekleme düğmesi
        )
      ],
    ),
    body: SafeArea(
      child: SizedBox.expand(
        child: cards.isEmpty // Kartlar listesi boşsa
            ? const Center(child: Text("No Card found.")) // Ekrana "No Card found." yazısı yazdır
            : ListView.builder( // Listview ile kartları görüntüle
                itemCount: cards.length, // Kart sayısı kadar öğe
                itemBuilder: (context, index) => AspectRatio( // Kartların boyut oranını koru
                  aspectRatio: 1.586, // Belirlenen oran
                  child: Container(
                    padding: const EdgeInsets.all(12), // Kenar boşlukları ayarla
                    margin: const EdgeInsets.all(12), // Kenar boşlukları ayarla
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), // Yuvarlatılmış köşeler
                      color: Color.fromARGB(255, 245, 164, 231), // Arka plan rengi
                    ),
                    child: Stack( // İçeriğin üst üste binmesi için kullanılır
                      children: [
                        Positioned( // Konumu ayarla
                          top: 10,
                          right: 10,
                          child: cards[index].cardNo.startsWith("4") // VISA kartı için VISA logosunu göster
                              ? Image.asset("assets/icons/visa_card.png",
                                  height: 60)
                              : cards[index].cardNo.startsWith("5") // Mastercard için Mastercard logosunu göster
                                  ? Image.asset(
                                      "assets/icons/master_card.png",
                                      height: 60)
                                  : const SizedBox(), // Diğer durumlarda boşluk bırak
                        ),
                        Positioned( // Konumu ayarla
                            top: 20,
                            left: 20,
                            child: Text(cards[index].title, // Kart başlığı
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                        Positioned( // Konumu ayarla
                            left: 20,
                            top: 50,
                            child: Text(cards[index].cardNo, // Kart numarası
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                ))),
                        Positioned( // Konumu ayarla
                            left: 20,
                            bottom: 20,
                            child: Text(cards[index].cardHolder)), // Kart sahibinin adı
                        Positioned( // Konumu ayarla
                          right: 20,
                          bottom: 20,
                          child: Text(cards[index].expMonth.toString() + // Son kullanma tarihi
                              "/" +
                              cards[index].expYear.toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    ),
    bottomNavigationBar: BottomNavigator(selectedIndex: 3), // Alt gezinme çubuğunu oluştur
  );
}


  Widget _buildPaymentBox(String imagePath, String text, String connectedText) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20), // Yatay kenar boşluğu ekler
    decoration: BoxDecoration(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[800] // Tema karanlık ise gri, değilse beyaz arka plan
          : Colors.white,
      borderRadius: BorderRadius.circular(12), // Yuvarlatılmış köşeler
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1), // Gölge rengi ve opaklığı
          spreadRadius: 3, // Yayılma yarıçapı
          blurRadius: 7, // Bulanıklık yarıçapı
          offset: Offset(0, 3), // Gölge pozisyonunu değiştirir
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // Satırın başlangıcında hizalama
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(imagePath, width: 40, height: 40), // Görsel
        ),
        SizedBox(width: 10), // Boşluk ekler
        Text(
          text, // Ana metin
          style: GoogleFonts.poppins(fontSize: 15), // Metin stili
        ),
        Expanded(
          child: Container(), // Bağlantılı metni sağa itmek için dolgu
        ),
        Text(
          connectedText, // Bağlantılı metin
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold), // Bağlantılı metin stili
        ),
        SizedBox(width: 10), // Metin ile kutu kenarı arasına boşluk ekler
      ],
    ),
  );
}


  Widget _buildAddCardButton() {
    return Container(
      width: double.infinity, // Tam genişlik
      decoration: BoxDecoration(
        color: Colors.black, // Siyah arka plan
        borderRadius: BorderRadius.circular(22), // Yuvarlatılmış köşeler
      ),
      child: ElevatedButton(
        onPressed: showAddCard, // showAddCard fonksiyonunu doğrudan çağırma
        child: Text('Add New Card'), // Düğme metni
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          foregroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          textStyle: GoogleFonts.poppins(color: Colors.black),
          // Düğme rengini buradan özelleştirin
        ),
      ),
    );
  }
}
