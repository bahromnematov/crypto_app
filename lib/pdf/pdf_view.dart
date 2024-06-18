// import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';
//
// class PdfView extends StatefulWidget {
//   const PdfView({super.key});
//
//   @override
//   State<PdfView> createState() => _PdfViewState();
// }
//
// class _PdfViewState extends State<PdfView> {
//   late PdfControllerPinch pdfController;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pdfController =
//         PdfControllerPinch(document: PdfDocument.openAsset('assets/pdf/1.pdf'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           _pdfView(),
//         ],
//       ),
//     );
//   }
//
//   Widget _pdfView() {
//     return Expanded(
//       child: PdfViewPinch(
//         controller: pdfController,
//         scrollDirection: Axis.vertical,
//       ),
//     );
//   }
// }
