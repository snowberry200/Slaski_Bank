import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../tabpage/tabpage.dart';
import '../widget/backgroundimage.dart';
import '../../layout/layout.dart';
import '../../layout/password_layout.dart';
import '../homepage/homepage.dart';
import '../widget/auth.dart';

class PasswordColumn extends StatefulWidget {
  final String sameCallback;

  const PasswordColumn({super.key, required this.sameCallback});

  @override
  State<PasswordColumn> createState() => _PasswordColumnState();
}

class _PasswordColumnState extends State<PasswordColumn> {
  // regular expression to check if string
  RegExp passValid = RegExp(r"(?=.*\d{2,4})(?=.*[A-Z])(?=.*\W)");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String passWord = pass.trim();
    if (passValid.hasMatch(passWord)) {
      return true;
    } else {
      return false;
    }
  }

  final authClient = AuthenticationClient();
  bool isProgress = false;

  bool isChecked = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Text forgot = const Text('Zapomniałeś hasło ?',
      style: TextStyle(
          color: Color(0xFFff6200),
          decoration: TextDecoration.underline,
          fontSize: 12));
  bool isPasswordVissible = false;
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final checkmark = Checkbox(
      value: isChecked,
      onChanged: (value) => setState(() {
        isChecked = value!;
      }),
      activeColor: const Color(0xFFff6200),
      checkColor: CupertinoColors.white,
      hoverColor: CupertinoColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      side: const BorderSide(width: 0.5),
    );

    final paswordfield = TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Hasło',
        labelStyle: const TextStyle(fontSize: 14, color: Color(0xFFff6200)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(),
        ),
        contentPadding:
            const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
        suffixIcon: IconButton(
          hoverColor: Colors.transparent,
          icon: isPasswordVissible
              ? const Tooltip(
                  message: 'Pokaż znaki',
                  textStyle:
                      TextStyle(fontSize: 14, color: CupertinoColors.white),
                  child: Text(
                    'Pokazać',
                    style: TextStyle(
                        color: Color(0xFFff6200),
                        decoration: TextDecoration.underline,
                        fontSize: 9,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : const Tooltip(
                  message: 'ukryć znaki',
                  textStyle:
                      TextStyle(fontSize: 12, color: CupertinoColors.white),
                  child: Text(
                    'ukryć',
                    style: TextStyle(
                        color: Color(0xFFff6200),
                        decoration: TextDecoration.underline,
                        fontSize: 9,
                        fontWeight: FontWeight.bold),
                  ),
                ),
          onPressed: () =>
              setState(() => isPasswordVissible = !isPasswordVissible),
        ),
      ),
      obscureText: isPasswordVissible,
      controller: _password,
      validator: (ifpassword) {
        if (ifpassword!.isNotEmpty && ifpassword.length < 6) {
          return 'Wprowadź poprawne hasło';
        } else if (ifpassword.isEmpty) {
          return "Proszę wprowadzić hasło";
        }
        bool result = validatePassword(ifpassword);
        if (result) {
          // create account event
          return null;
        } else {
          return " Enter a correct password";
        }
      },
    );

    return BackgroundImageWidget(
        image: Layout.isMobile(context)
            ? const AssetImage('images/pine.jpeg')
            : const AssetImage('images/engine.jpeg'),
        child: Scaffold(
            backgroundColor: PasswordLayout.isMobile(context)
                ? Colors.white
                : Colors.transparent,
            appBar: PasswordLayout.isMobile(context)
                ? AppBar(
                    backgroundColor: CupertinoColors.white,
                    elevation: 0,
                    shadowColor: null,
                    title: PasswordLayout.isMobile(context)
                        ? const Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Image(
                                width: 100,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.contain,
                                height: 30,
                                image: AssetImage('images/ing.png')),
                          )
                        : const Image(
                            width: 100,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.contain,
                            height: 30,
                            image: AssetImage('images/ing.png')),
                  )
                : null,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        width: PasswordLayout.isMobile(context)
                            ? width
                            : width / 2.0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 40, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                  child: PasswordLayout.isMobile(context)
                                      ? const Padding(
                                          padding: EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            'Wprowadź hasło',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.2),
                                          ))
                                      : const Center(
                                          child: Text(
                                          'Wprowadź hasło',
                                          style: TextStyle(
                                              color: CupertinoColors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2),
                                        ))),
                              const SizedBox(height: 20),
                              SizedBox(
                                  child: PasswordLayout.isMobile(context)
                                      ? const Padding(
                                          padding: EdgeInsets.only(
                                              left: 40, top: 10),
                                          child: Text(
                                            'Adres e-mail',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.0),
                                          ))
                                      : const Padding(
                                          padding: EdgeInsets.only(left: 40.0),
                                          child: Text(
                                            'Adres e-mail',
                                            style: TextStyle(
                                                color: CupertinoColors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.0),
                                          ),
                                        )),
                              SizedBox(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.sameCallback,
                                        style: TextStyle(
                                            color: Layout.isMobile(context)
                                                ? Colors.black
                                                : CupertinoColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1.0),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        hoverColor: CupertinoColors.white,
                                        child: const Center(
                                          child: Text(
                                            'Zmiana',
                                            style: TextStyle(
                                                color: Color(0xFFff6200),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1.0,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    Color(0xFFff6200)),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Form(
                                  key: formkey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30,
                                        bottom: 20,
                                        left: 40,
                                        right: 40),
                                    child: paswordfield,
                                  )),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: MaterialButton(
                                        hoverColor: Colors.white,
                                        onPressed: () {},
                                        child: forgot),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Row(
                                  children: [
                                    Transform.scale(
                                        scale: 1.1, child: checkmark),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Nie wylogowuj mnie',
                                      style: TextStyle(
                                          color: Layout.isMobile(context)
                                              ? CupertinoColors.black
                                              : CupertinoColors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 40),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Text(
                                            'odznacz komputer publiczny.',
                                            style: TextStyle(
                                                color: Layout.isMobile(context)
                                                    ? CupertinoColors.black
                                                    : CupertinoColors.white,
                                                fontSize: 14),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          MaterialButton(
                                            hoverColor: Colors.white,
                                            onPressed: () {},
                                            child: const Text('Jeszcze',
                                                style: TextStyle(
                                                    color: Color(0xFFff6200),
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 16)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 40, left: 40, right: 40),
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TabPage()));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xFFff6200),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      minimumSize: const Size.fromHeight(50),
                                      fixedSize: const Size(150, 30),
                                    ),
                                    child: const Text(
                                      'Zaloguj się',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            )));
  }
}
