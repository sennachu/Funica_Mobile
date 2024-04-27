import 'package:dash_chat_2/dash_chat_2.dart'; // Sohbet arayüzünü sağlayan paket
import 'package:flutter/material.dart'; // Flutter ile uygulama geliştirmenin temel gereksinimlerini sağlayan paket
import 'package:flutter_gemini/flutter_gemini.dart'; // Gemini AI ile iletişim kurmak için kullanılan paket
import 'package:go_router/go_router.dart'; // Routing işlemini yöneten paket
import 'package:google_fonts/google_fonts.dart'; // Özelleştirilmiş yazı tipi sağlayan paket

class SoruSorScreen extends StatefulWidget {
  const SoruSorScreen({super.key});

  // StatefulWidget'in state'ini oluşturur
  @override
  State<SoruSorScreen> createState() => _SoruSorScreenState();
}

class _SoruSorScreenState extends State<SoruSorScreen> {
  // Gemini AI örneği
  final Gemini gemini = Gemini.instance;

  // Sohbette görüntülenecek mesajların listesi
  List<ChatMessage> messages = [];

  // Sohbette görüntülenecek kullanıcıların bilgilerini tutan nesneler
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(id: "1", firstName: "Gemini");

  // Uygulama arayüzünü oluşturur
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Uygulama başlığını oluşturur
      appBar: AppBar(
        // Arka plan rengi
        backgroundColor: Color.fromARGB(255, 7, 11, 96),
        // Geri dönme butonu
        leading: IconButton(
          // Geri dönme butonu ikonu
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          // Geri dönme butonuna basıldığında çalışacak fonksiyon
          onPressed: () {
            // Uygulamanın geçerli context'i alır
            GoRouter.of(context).go('/home');
          },
        ),
        // Uygulama başlığı
        title: Text(
          // Başlık metni
          "Funica Chat",
          // Metin rengi
          style: TextStyle(color: Colors.white)
        ),
      ),

      // Uygulama içeriğini oluşturur
      body: _buildUI(),
    );
  }

  // Sohbet arayüzünü oluşturan widget
  Widget _buildUI() {
    return DashChat(
      // Sohbette görüntülenecek kullanıcı bilgileri
      currentUser: currentUser,
      // Mesaj gönderimine yanıt veren fonksiyon
      onSend: _sendMessage,
      // Sohbette görüntülenecek mesajlar
      messages: messages,
    );
  }

  // Mesaj gönderme işlemini yöneten fonksiyon
  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      // Gönderilen mesajı mesaj listesine ekle
      messages = [chatMessage, ...messages];
    });
    try {
      // Gönderilen mesajdan soruyu çıkar
      String question = chatMessage.text;

      // Gemini AI'nin soruya cevabını dinle
      gemini.streamGenerateContent(question).listen((event) {
        // Sohbetin son mesajını al
        ChatMessage? lastMessage = messages.firstOrNull;

        // Son mesajın Geminiden olup olmadığını kontrol et
        if (lastMessage != null && lastMessage.user == geminiUser) {
          // Listenin son mesajını kaldır
          lastMessage = messages.removeAt(0);

          // Gemini'nin cevabını al
          String response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
              "";

          // Gemini'nin cevabını önceki mesaja ekle
          lastMessage.text += response;

          // Değiştirilmiş mesajla sohbeti güncelle
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          // Eğer Gemini henüz cevap vermediyse, yeni bir mesaj oluştur
          String response = event.content?.parts
                  ?.fold("", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
            // Mesajı Gemini'den gönderen kullanıcı bilgileri
            user: geminiUser,
            // Mesajın oluşturulma tarihi
            createdAt: DateTime.now(),
            // Mesaj metni
            text: response,
          );

          // Sohbeti Gemininin mesajı ile güncelle
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      // Hata oluştuğunda hata mesajını konsola yazdır
      print(e);
    }
  }
}