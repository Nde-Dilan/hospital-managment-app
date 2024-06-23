import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            TableCell(
              child: Text(
                "Type of WBC",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black), // Header style
              ),
            ),
            TableCell(
              child: Text(
                "Normal percentage of overall WBC count",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black), // Header style
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "neutrophil"),
            ),
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "55–70%"),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "lymphocyte"),
            ),
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "20–40%"),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "eosinophil"),
            ),
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "1–4%"),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "monocyte"),
            ),
            TableCell(
              child: Text(style: TextStyle(color: Colors.black), "2–8%"),
            ),
          ],
        ),
      ],
    );
  }
}

const appointmentsHistoryList = [
  {
    "title": "White blood cells concentration ",
    "description":
        'Description White blood cells (WBC) are a heterogeneous group of nucleated cells that can be found in circulation for at least a period of their life.',
    "image": "assets/images/appointments-history.png",
    "results": TableWidget(),
  },
  {
    "title": "White blood cells concentration ",
    "description":
        'Description White blood cells (WBC) are a heterogeneous group of nucleated cells that can be found in circulation for at least a period of their life.',
    "image": "assets/images/appointments-history.png",
    "results": TableWidget(),
  },
];
