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
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Yeni Kart Tanımlama",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Kart Başlığı",
                        labelText: "Kart Başlığı",
                      ),
                      controller: titleCnt,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Ad Soyad",
                        labelText: "Ad Soyad",
                      ),
                      controller: cardHolderCnt,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Kart No",
                        labelText: "Kart No",
                      ),
                      onChanged: (value) {
                        setState(() {
                          cardNo = value;
                          if (value.startsWith("4")) {
                            type = "visa";
                          } else if (value.startsWith("5")) {
                            type = "master";
                          } else if (value.startsWith("9") ||
                              value.startsWith("6") ||
                              value.startsWith("3")) {
                            type = "troy";
                          } else {
                            type = "";
                          }
                        });
                      },
                      keyboardType: TextInputType.number,
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
                            obscureText: true,
                            controller: cvv2Cnt,
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
                            controller: expMonthCnt,
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
                            controller: expYearCnt,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      title: Text("Kartı Kaydet"),
                      value: remember,
                      onChanged: (value) => setState(() => remember = value),
                    ),
                    if (type.isNotEmpty) ...[
                      SizedBox(height: 20),
                      Image.asset(
                        "assets/icons/${type}_card.png",
                        height: 60,
                        width: 100,
                      ),
                    ],
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: saveCard,
                      child: Text("Onayla"),
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
                onPressed: showAddCard, icon: const Icon(Icons.add)),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox.expand(
            child: cards.isEmpty
                ? const Center(child: Text("No Card found."))
                : ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => AspectRatio(
                aspectRatio: 1.586,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(255, 245, 164, 231),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 10,
                        child: cards[index].cardNo.startsWith("4")
                            ? Image.asset("assets/icons/visa_card.png",
                            height: 60)
                            : cards[index].cardNo.startsWith("5")
                            ? Image.asset(
                            "assets/icons/master_card.png",
                            height: 60)
                            : const SizedBox(),
                      ),
                      Positioned(
                          top: 20,
                          left: 20,
                          child: Text(cards[index].title,style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold))),
                      Positioned(
                          left: 20,
                          top: 50,
                          child: Text(cards[index].title,style: GoogleFonts.poppins(fontSize: 14,))),
                      Positioned(
                          left: 20,
                          bottom: 20,
                          child: Text(cards[index].cardHolder)),
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: Text(cards[index].expMonth.toString() +
                            "/" +
                            cards[index].expYear.toString()),
                      ),
                    ],
                  ),),
              ),
            )),
      ),
      bottomNavigationBar: BottomNavigator(selectedIndex: 3),
    );
  }

  Widget _buildPaymentBox(String imagePath, String text, String connectedText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20), // Add horizontal margin
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(imagePath, width: 40, height: 40), // Asset Image
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(fontSize: 15),
          ),
          Expanded(
            child: Container(), // Spacer to push connected text to the right
          ),
          Text(
            connectedText,
            style:
            GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10), // Add spacing between text and box edge
        ],
      ),
    );
  }

  Widget _buildAddCardButton() {
    return Container(
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        color: Colors.black, // Black background
        borderRadius: BorderRadius.circular(22), // Rounded corners
      ),
      child: ElevatedButton(
        onPressed: showAddCard, // Directly reference the showAddCard function
        child: Text('Add New Card'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          foregroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.white,
          textStyle: GoogleFonts.poppins(color: Colors.black),
          // Customize the button color here
        ),
      ),
    );
  }}
