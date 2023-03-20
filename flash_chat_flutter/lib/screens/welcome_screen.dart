import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';
import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  /**'static' oldugu icin diger classlarda object(nesne) olusturmadan direkt class uzerinden bu degisken cagrilabilecek. Ornegin, 'WelcomeScreen.id' gibi.
     Bunun yaninda 'const' ile de tanimlandigi icin erisim saglanan class'ta degeri degistirilemeyip bir sabit olarak kullanilacak. Performans anlaminda
      bu sekilde tanimlanmasi onemli bir etki yaratir cunku aksi halde String id olarak tanimlanip diger classlardan object olsuturarak buna erisilse, her cagrim
      sonucunda _WelcomeScreenState class'i ve onun icindeki build() metodu vs. de tetiklenip calisacakti, bu da ciddi bir performans kaybina sebep olacakti.
      => Ek bilgi olarak, 'const' ile tanimlanan degiskenlere 'static' keyword'u de eklenmelidir cunku constant oldugundan kullanildigi yerde her object(nesne) icin
      ayni degeri ifade edecegi bilindiginden, object olmadan direkt 'class_ismi.degisken_adi' uzerinden bu degiskene erisim saglanabilir olmalidir!
   */

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                        textStyle: kTypeWriterAnimatedTextStyle)
                  ],
                  totalRepeatCount: 3,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.lightBlueAccent,
                buttonTitle: 'Log In',
                onPressedFunc: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
              color: Colors.blueAccent,
              buttonTitle: 'Register',
              onPressedFunc: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
