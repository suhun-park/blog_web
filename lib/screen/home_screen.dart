import 'package:blog_web/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('http://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://suhunhope.tistory.com/'));

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("SuhunBlog"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              if(controller!= null) {
                controller!.loadRequest(Uri.parse('https://suhunhope.tistory.com/'));
              }
            }, icon: Icon(Icons.home)),
            IconButton(onPressed: (){

              if(controller!=null){
                controller!.goBack();
              }
            }, icon: Icon(Icons.arrow_back))
          ],
        ),
        body:  WebViewWidget(
          controller: controller,
        )
    );
  }
}
