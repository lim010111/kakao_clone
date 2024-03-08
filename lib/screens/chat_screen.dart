import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao/custom_icons_icons.dart';
import 'package:kakao/widgets/guestmessage_widget.dart';
import 'package:kakao/widgets/usermessagebox_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  static TextEditingController inputController = TextEditingController();
  static String inputText = "";
  static List<String> inputList = [];

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  Size? size;
  late SharedPreferences prefs;
  static const String guestName = "임우현";
  final FocusNode focusNode = FocusNode();

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // Future _saveData() async {
  //   if (prefs.getStringList('myList') != null) {
  //     List<String> chatList =
  //         ChatScreen.inputList + prefs.getStringList('myList')!;
  //     prefs.setStringList('myList', chatList);
  //   } else {
  //     prefs.setStringList('myList', ChatScreen.inputList);
  //   }
  // }

  // Future _loadData() async {
  //   final myList = prefs.getStringList('myList');
  //   return myList;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffB2C7DA),
      appBar: AppBar(
        backgroundColor: const Color(0xffB2C7DA),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(guestName),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CustomIcons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.format_list_bulleted,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return (ChatScreen.inputList.length - index - 1) % 2 == 0
                          ? UserMessageBox(index: index)
                          : GuestMessageBox(
                              index: index,
                              guestName: guestName,
                            );
                    },
                    itemCount: ChatScreen.inputList.length),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    Expanded(
                      child: TextField(
                        focusNode: focusNode,
                        maxLines: null,
                        controller: ChatScreen.inputController,
                        keyboardType: TextInputType.text,
                        showCursor: true,
                      ),
                    ),
                    const Icon(Icons.emoji_emotions_outlined),
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                        onPressed: sendMessage,
                        icon: focusNode.hasFocus
                            ? const Icon(Icons.send)
                            : const Icon(Icons.tag)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() {
    if (ChatScreen.inputController.text != "") {
      setState(() {
        ChatScreen.inputText = ChatScreen.inputController.text;
        ChatScreen.inputController.clear();
      });
      ChatScreen.inputList = ChatScreen.inputList.reversed.toList();
      ChatScreen.inputList.add(ChatScreen.inputText);
      ChatScreen.inputList = ChatScreen.inputList.reversed.toList();
    } else {
      null;
    }
  }
}
