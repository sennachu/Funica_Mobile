import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SoruSorScreen extends StatefulWidget {
  const SoruSorScreen({super.key});

  @override
  State<SoruSorScreen> createState() => _SoruSorScreenState();
}

class _SoruSorScreenState extends State<SoruSorScreen> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(id: "1", firstName: "Gemini");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     backgroundColor: Color.fromARGB(255, 21, 54, 81),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
        ),
        title: Text(
          "Funica Cpt",
          style: TextStyle(color: Colors.white),
          
          
          
        ),
      ), 

      body: _buildUI(),
    );
  }

  // Sohbet arayüzünü oluşturan widget
  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  // Mesaj gönderme işlemini yöneten fonksiyon
  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      // Gönderilen mesajdan soruyu çıkar
      String question = chatMessage.text;

      // Gemininin soruya cevabını dinle
      gemini.streamGenerateContent(question).listen((event) {
        // Sohbetin son mesajını al
        ChatMessage? lastMessage = messages.firstOrNull;

        // Son mesajın Geminiden olup olmadığını kontrol et
        if (lastMessage != null && lastMessage.user == geminiUser) {
          // Listenin son mesajını kaldır
          lastMessage = messages.removeAt(0);

          // Gemininin cevabını al
          String response = event.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
              "";

          // Gemininin cevabını önceki mesaja ekle
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
            user: geminiUser,
            createdAt: DateTime.now(),
            text: response,
          );

          // Sohbeti Gemininin mesajı ile güncelle
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
