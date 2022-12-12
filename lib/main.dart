import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'dart:core';

void main() {
  runApp(const PeopleCounter());
}

class PeopleCounter extends StatelessWidget {
  const PeopleCounter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Peaple_Counter App',
      // locale: Locale('pt','BR'),
      // locale: Locale('en'),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int peopleInside = 0;
  int capacity = 20;

  void peopleOut() {
    setState(() {
      peopleInside++;
    });
  }

  void peopleInto() {
    setState(() {
      peopleInside--;
    });
  }

  void setCapacity(int? value) {
    setState(() {
      value != null ? capacity = value : null;
    });
  }

  bool get isEmpty => peopleInside == 0;
  bool get isFull => peopleInside == capacity;
  int lang = 0;
  List lLang = S.delegate.supportedLocales;
  String sLang = 'pt';
  String sFlag = 'images/pt.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).title,
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 5,
            ),
          ),
        ),
        actions: [
          IconButton(
            tooltip: sLang,
            icon: Image.asset(sFlag),
            iconSize: 24,
            onPressed: () {
              setState(() {
                lang == lLang.length - 1 ? lang = 0 : lang++;
                sLang = lLang[lang].toString();
                // print('$lang - $sLang - $lLang');
                S.load(Locale(sLang));
                if (lang == lLang.length - 1) {
                  sLang = lLang[0].toString();
                } else {
                  sLang = lLang[lang + 1].toString();
                }
                sFlag = 'images/$sLang.jpg';
              });
            },
          ),
        ],
        // actions: [
        //   ToggleButtons(isSelected: const [true, false],
        //   children: [IconButton( icon: Image.asset('..\\assets\\images\\br.jpg'), onPressed: () {  },)],)
        // ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/image.jpg'),
          fit: BoxFit.cover,
          opacity: 0.25,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? S.of(context).noEntry : S.of(context).allowedEntry,
              style: TextStyle(
                fontSize: 50,
                color: isFull ? const Color(0xffff0000) : Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Text(
                isFull
                    ? S.of(context).fullCapacity
                    : (capacity - peopleInside) == 1
                        ? '${capacity - peopleInside}  ${S.of(context).place}'
                        : '${capacity - peopleInside}  ${S.of(context).places}',
                style: TextStyle(
                  fontSize: 80,
                  color: isFull ? const Color(0xffff0000) : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isFull
                    ? const SizedBox(
                        width: 120,
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.green,
                            fixedSize: const Size(120, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                24,
                              ),
                            )),
                        onPressed: isFull ? null : peopleOut,
                        child: Text(
                          isFull ? '' : S.of(context).into,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.black),
                        ),
                      ),
                const SizedBox(
                  width: 120,
                ),
                isEmpty
                    ? const SizedBox(
                        width: 120,
                      )
                    : TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.lightBlue,
                            fixedSize: const Size(120, 80),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                24,
                              ),
                            )),
                        onPressed: isEmpty ? null : peopleInto,
                        child: Text(
                          isEmpty ? '' : S.of(context).out,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.black),
                        ),
                      ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 80),
                  child: Text(
                    S.of(context).capacity + ': ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: TextField(
                    onSubmitted: ((value) {
                      setCapacity(int.tryParse(value));
                    }),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      constraints: const BoxConstraints(maxWidth: 40),
                      hintText: capacity.toString(),
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 80),
                  child: Text(
                    '${S.of(context).occupants}: $peopleInside ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
