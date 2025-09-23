class Plan {
  final String name;         // Display name
  final String serverName;   // Name to send to server
  final String opcode;       // Short code
  final String spKey;        // Special key
  final String image;        // Image path or asset

  Plan({
    required this.name,
    required this.serverName,
    required this.opcode,
    required this.spKey,
    required this.image,
  });
}

// final List<Plan> plans = [
//   Plan(
//     name: "Airtel Digital TV",
//     serverName: "Airtel dth",
//     opcode: "AD",
//     spKey: "51",
//     image: "assets/img.png",
//   ),
//   Plan(
//     name: "Dish TV",
//     serverName: "Dish TV",
//     opcode: "DT",
//     spKey: "53",
//     image: "assets/img_1.png",
//   ),
//   Plan(
//     name: "Sun Direct",
//     serverName: "Sun Direct",
//     opcode: "SD",
//     spKey: "54",
//     image: "assets/img_2.png",
//   ),
//   Plan(
//     name: "Tata Sky",
//     serverName: "Tata Sky",
//     opcode: "TS",
//     spKey: "55",
//     image: "assets/img_3.png",
//   ),
//   Plan(
//     name: "Videocon D2H",
//     serverName: "Videocon",
//     opcode: "VD",
//     spKey: "56",
//     image: "assets/img_4.png",
//   ),
// ];
