import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagyourtaxi_driver/functions/functions.dart';
import 'package:tagyourtaxi_driver/pages/loadingPage/loading.dart';
import 'package:tagyourtaxi_driver/pages/login/login.dart';
import 'package:tagyourtaxi_driver/pages/noInternet/nointernet.dart';
import 'package:tagyourtaxi_driver/pages/vehicleInformations/referral_code.dart';
import 'package:tagyourtaxi_driver/styles/styles.dart';
import 'package:tagyourtaxi_driver/translation/translation.dart';
import 'package:tagyourtaxi_driver/widgets/widgets.dart';

class OwnersRegister extends StatefulWidget {
  const OwnersRegister({Key? key}) : super(key: key);

  @override
  State<OwnersRegister> createState() => _OwnersRegisterState();
}

String ownerName = ''; //name of user
String ownerEmail = ''; // email of user
String companyName = '';
String companyAddress = '';
String city = '';
String postalCode = '';
String taxNumber = '';
String ownerServiceLocation = '';

class _OwnersRegisterState extends State<OwnersRegister> {
  bool _loading = true;
  bool _chooseLocation = false;
  var verifyEmailError = '';
  var error = '';

  TextEditingController emailText =
      TextEditingController(); //email textediting controller
  TextEditingController nameText =
      TextEditingController(); //name textediting controller
  TextEditingController companyText =
      TextEditingController(); //name textediting controller
  TextEditingController addressText =
      TextEditingController(); //name textediting controller
  TextEditingController cityText =
      TextEditingController(); //name textediting controller
  TextEditingController postalText =
      TextEditingController(); //name textediting controller
  TextEditingController taxText =
      TextEditingController(); //name textediting controller

  @override
  void initState() {
    getLocations();
    super.initState();
  }

  getLocations() async {
    await getServiceLocation();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material(
      child: Directionality(
        textDirection: (languageDirection == 'rtl')
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: media.width * 0.08,
                    right: media.width * 0.08,
                    top:
                        media.width * 0.05 + MediaQuery.of(context).padding.top,
                    bottom: media.width * 0.05),
                height: media.height * 1,
                width: media.width * 1,
                color: page,
                child: Column(
                  children: [
                    Container(

                        // height: media.height * 0.12,
                        width: media.width * 1,
                        color: topBar,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back)),
                          ],
                        )),
                    Expanded(
                        child: Scaffold(
                      backgroundColor: page,
                      body: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: media.height * 0.04,
                            ),
                            SizedBox(
                              width: media.width * 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    languages[choosenLanguage]
                                        ['text_get_started'],
                                    style: GoogleFonts.roboto(
                                        fontSize: media.width * twentyeight,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            Text(
                              languages[choosenLanguage]['text_fill_form'],
                              style: GoogleFonts.roboto(
                                  fontSize: media.width * sixteen,
                                  color: textColor.withOpacity(0.3)),
                            ),
                            SizedBox(height: media.height * 0.04),

                            // name input field
                            InputField(
                              icon: Icons.person_outline_rounded,
                              text: languages[choosenLanguage]['text_name'],
                              onTap: (val) {
                                setState(() {
                                  ownerName = nameText.text;
                                });
                              },
                              textController: nameText,
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            // email input field
                            InputField(
                              icon: Icons.email_outlined,
                              text: languages[choosenLanguage]['text_email'],
                              onTap: (val) {
                                setState(() {
                                  ownerEmail = emailText.text;
                                });
                              },
                              textController: emailText,
                              color:
                                  (verifyEmailError == '') ? null : Colors.red,
                            ),
                            //email already exist error
                            (verifyEmailError != '')
                                ? Container(
                                    margin: EdgeInsets.only(
                                        top: media.height * 0.03),
                                    alignment: Alignment.center,
                                    width: media.width * 0.8,
                                    child: Text(
                                      verifyEmailError,
                                      style: GoogleFonts.roboto(
                                          fontSize: media.width * sixteen,
                                          color: Colors.red),
                                    ),
                                  )
                                : Container(),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_chooseLocation == false) {
                                    _chooseLocation = true;
                                  } else {
                                    _chooseLocation = false;
                                  }
                                });
                              },
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.only(
                                    left: media.width * 0.035, right: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: underline))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                            Icons.location_city_outlined),
                                        SizedBox(
                                          width: media.width * 0.05,
                                        ),
                                        SizedBox(
                                          width: media.width * 0.5,
                                          child: Text(
                                            (ownerServiceLocation == '')
                                                ? 'choose area'
                                                : serviceLocations.firstWhere(
                                                        (element) =>
                                                            element['id'] ==
                                                            ownerServiceLocation)[
                                                    'name'],
                                            style: GoogleFonts.roboto(
                                                fontSize: media.width * sixteen,
                                                color: textColor),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon((_chooseLocation == false)
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up)
                                  ],
                                ),
                              ),
                            ),
                            (_chooseLocation == true)
                                ? Container(
                                    margin:
                                        EdgeInsets.all(media.height * 0.006),
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          color: Colors.black.withOpacity(0.2))
                                    ], color: page),
                                    height: media.width * 0.4,
                                    child: (serviceLocations.isNotEmpty)
                                        ? Column(
                                            children: serviceLocations
                                                .asMap()
                                                .map((i, value) {
                                                  return MapEntry(
                                                      i,
                                                      InkWell(
                                                        onTap: () {
                                                          ownerServiceLocation =
                                                              serviceLocations[
                                                                  i]['id'];
                                                          _chooseLocation =
                                                              false;
                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  media.width *
                                                                      0.05),
                                                          width:
                                                              media.width * 0.9,
                                                          child: Text(
                                                            serviceLocations[i]
                                                                ['name'],
                                                            style: GoogleFonts.roboto(
                                                                fontSize: media
                                                                        .width *
                                                                    fourteen,
                                                                color:
                                                                    textColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ));
                                                })
                                                .values
                                                .toList(),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(
                                                media.width * 0.05),
                                            width: media.width * 0.9,
                                            child: Text(
                                              languages[choosenLanguage]
                                                  ['text_no_data_found'],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                  fontSize:
                                                      media.width * fourteen,
                                                  color: textColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                  )
                                : Container(),
                            SizedBox(
                              height: media.height * 0.012,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: underline))),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          countries[phcode]['dial_code'],
                                          style: GoogleFonts.roboto(
                                              fontSize: media.width * sixteen,
                                              color: textColor),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Icon(Icons.keyboard_arrow_down)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    phnumber,
                                    style: GoogleFonts.roboto(
                                        fontSize: media.width * sixteen,
                                        color: textColor,
                                        letterSpacing: 2),
                                  )
                                ],
                              ),
                            ),

                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            // name input field
                            InputField(
                              icon: Icons.home_work_outlined,
                              text: 'Company Name',
                              onTap: (val) {
                                setState(() {
                                  companyName = companyText.text;
                                });
                              },
                              textController: companyText,
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            // name input field
                            InputField(
                              icon: Icons.home_outlined,
                              text: 'Address',
                              onTap: (val) {
                                setState(() {
                                  companyAddress = addressText.text;
                                });
                              },
                              textController: addressText,
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            // name input field
                            InputField(
                              icon: Icons.home_outlined,
                              text: 'City',
                              onTap: (val) {
                                setState(() {
                                  city = cityText.text;
                                });
                              },
                              textController: cityText,
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            // name input field
                            InputField(
                              icon: Icons.post_add,
                              inputType: TextInputType.number,
                              text: 'Postal Code',
                              onTap: (val) {
                                setState(() {
                                  postalCode = postalText.text;
                                });
                              },
                              textController: postalText,
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            // name input field
                            InputField(
                              icon: Icons.document_scanner_outlined,
                              text: 'Tax Number',
                              onTap: (val) {
                                setState(() {
                                  taxNumber = taxText.text;
                                });
                              },
                              textController: taxText,
                            ),
                            SizedBox(
                              height: media.height * 0.012,
                            ),
                            SizedBox(
                              height: media.height * 0.065,
                            ),
                          ],
                        ),
                      ),
                    )),
                    (error != '')
                        ? Container(
                            margin: EdgeInsets.only(
                                top: media.height * 0.03,
                                bottom: media.height * 0.03),
                            alignment: Alignment.center,
                            width: media.width * 0.8,
                            child: Text(
                              error,
                              style: GoogleFonts.roboto(
                                  fontSize: media.width * sixteen,
                                  color: Colors.red),
                            ),
                          )
                        : Container(),
                    (nameText.text.isNotEmpty &&
                            ownerServiceLocation != '' &&
                            emailText.text.isNotEmpty &&
                            companyText.text.isNotEmpty &&
                            addressText.text.isNotEmpty &&
                            cityText.text.isNotEmpty &&
                            postalText.text.isNotEmpty &&
                            taxText.text.isNotEmpty)
                        ? Container(
                            width: media.width * 1,
                            alignment: Alignment.center,
                            child: Button(
                                onTap: () async {
                                  String pattern =
                                      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])*$";
                                  RegExp regex = RegExp(pattern);
                                  if (regex.hasMatch(emailText.text)) {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    setState(() {
                                      verifyEmailError = '';
                                      error = '';
                                      _loading = true;
                                    });
                                    var result =
                                        await validateEmail(ownerEmail);

                                    if (result == 'success') {
                                      setState(() {
                                        verifyEmailError = '';
                                      });
                                      var val = await registerOwner();
                                      if (val == 'true') {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Referral()),
                                            (route) => false);
                                        serviceLocations.clear();
                                      } else {
                                        error = val.toString();
                                      }
                                    } else {
                                      setState(() {
                                        verifyEmailError = result.toString();
                                      });
                                      debugPrint('failed');
                                    }
                                    setState(() {
                                      _loading = false;
                                    });
                                  } else {
                                    setState(() {
                                      verifyEmailError =
                                          languages[choosenLanguage]
                                              ['text_email_validation'];
                                    });
                                  }
                                },
                                text: languages[choosenLanguage]['text_next']))
                        : Container(),
                  ],
                ),
              ),

              //internet not connected
              (internet == false)
                  ? Positioned(
                      top: 0,
                      child: NoInternet(
                        onTap: () {
                          setState(() {
                            internetTrue();
                          });
                        },
                      ))
                  : Container(),

              //loader
              (_loading == true)
                  ? const Positioned(top: 0, child: Loading())
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
