import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnim extends StatelessWidget {
  const LoadingAnim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.network('assets/animations/loading.json', height: 200));
  }
}
