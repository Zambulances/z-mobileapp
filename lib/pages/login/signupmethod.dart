// import 'package:flutter/material.dart';
// import 'package:tagyourtaxi_driver/functions/functions.dart';
// import 'package:tagyourtaxi_driver/pages/login/get_started.dart';
// import 'package:tagyourtaxi_driver/pages/login/ownerregister.dart';
// import 'package:tagyourtaxi_driver/styles/styles.dart';
// import 'package:tagyourtaxi_driver/widgets/widgets.dart';

// class SignupMethod extends StatefulWidget {
//   const SignupMethod({ Key? key }) : super(key: key);

//   @override
//   State<SignupMethod> createState() => _SignupMethodState();
// }

// class _SignupMethodState extends State<SignupMethod> {
//   @override
//   Widget build(BuildContext context) {

//     var media = MediaQuery.of(context).size;
//     return Material(
//       child: Directionality(
//         textDirection: (languageDirection == 'rtl')
//             ? TextDirection.rtl
//             : TextDirection.ltr,
//         child: Container(
//           padding: EdgeInsets.fromLTRB(media.width*0.08, MediaQuery.of(context).padding.top + media.width*0.05, media.width*0.08, media.width*0.05),
//           height: media.height*1,
//           width: media.width*1,
//           color: page,
//           child: Column(
//             children: [
//               Container(

//                         // height: media.height * 0.12,
//                         width: media.width * 1,
//                         color: topBar,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: const Icon(Icons.arrow_back)),
//                           ],
//                         )),
//                         SizedBox(height: media.width*0.1,),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Button(

//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>GetStarted()));
//                         }, text: 'Register as Driver'),
//                       SizedBox(height: media.width*0.05,),
//                       Button(onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnersRegister()));
//                       }, text: 'Register as Fleet Owner'),

//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
