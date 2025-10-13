import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/themes/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../config/themes/colors.dart';

@RoutePage()
class CustonWebViewPage extends StatefulWidget {
  const CustonWebViewPage({
    super.key,
    required this.url,
    this.onPageFinished,
    this.title,
  });

  final String url;
  final String? title;
  final ValueChanged<String>? onPageFinished;

  @override
  State<CustonWebViewPage> createState() => _CustonWebViewPageState();
}

class _CustonWebViewPageState extends State<CustonWebViewPage> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            if (widget.onPageFinished != null) {
              widget.onPageFinished!(url);
            }
          },
          // onProgress: _onProgress,
          // onPageStarted: _onPageStarted,
          // onWebResourceError: _onWebResourceError,
        ),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: widget.title != null
          ? AppBar(
              title: Text(widget.title!, style: AppStyles.headline),
              centerTitle: true,
              leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => context.popRoute(),
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  width: 32,
                  height: 40,
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 17.33,
                          height: 12.67,
                          child: SvgPicture.asset(
                            'assets/icons/arrow_back_android.svg',
                            width: 17.33,
                            height: 5,
                            colorFilter: const ColorFilter.mode(
                              AppColors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : null,
      body: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: (Platform.isAndroid && widget.url.contains('.pdf'))
            ? const PDF().cachedFromUrl(widget.url,
                placeholder: (_) => const Center(child: Text('Загрузка...')))
            : WebViewWidget(
                controller: controller,
              ),
      ),
    );
  }
}
