import 'package:flutter/material.dart';
import 'package:recharge_retry/widgets/crm_savekart/select_app_page.dart';

class ComplaintListPage extends StatefulWidget {
  const ComplaintListPage({Key? key}) : super(key: key);

  @override
  State<ComplaintListPage> createState() => _ComplaintListPageState();
}

class _ComplaintListPageState extends State<ComplaintListPage> {
  TextEditingController searchController = TextEditingController();
  DateTime? selectedDate;

  /// 🔹 Dummy complaint data (API ready)
  final List<Map<String, dynamic>> complaints = [
    {
      "id": "1023",
      "orderId": "5539",
      "issue": "Order Not Found",
      "status": "Pending",
      "date": "09 Jan 2026",
      "appName": "SaveKart",
    },
    {
      "id": "1024",
      "orderId": "5540",
      "issue": "Payment Update",
      "status": "In Progress",
      "date": "10 Jan 2026",
      "appName": "SaveApp",
    },
    {
      "id": "1025",
      "orderId": "5541",
      "issue": "Amount Refund",
      "status": "Resolved",
      "date": "11 Jan 2026",
      "appName": "SaveKart",
    },
  ];

  List<Map<String, dynamic>> filteredComplaints = [];

  @override
  void initState() {
    super.initState();
    filteredComplaints = complaints;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints list"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SelectAppPage()),
                );
              },
              child: const Text(
                "Add New",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _filterSection(),
          Expanded(
            child: filteredComplaints.isEmpty
                ? _emptyView()
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredComplaints.length,
              itemBuilder: (context, index) {
                return _complaintCard(filteredComplaints[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 🔍 Filter Section (Search + Date)
  Widget _filterSection() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by App Name",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (_) => _applyFilters(),
            ),

          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _pickDate,
          ),
          if (selectedDate != null)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                selectedDate = null;
                _applyFilters();
              },
            ),
        ],
      ),
    );
  }

  /// 🧠 Apply Search & Date Filters
  void _applyFilters() {
    setState(() {
      filteredComplaints = complaints.where((item) {
        final appMatch = item['appName']
            .toString()
            .toLowerCase()
            .contains(searchController.text.toLowerCase());

        final dateMatch = selectedDate == null
            ? true
            : item['date'] ==
            "${selectedDate!.day.toString().padLeft(2, '0')} "
                "${_monthName(selectedDate!.month)} "
                "${selectedDate!.year}";

        return appMatch && dateMatch;
      }).toList();
    });
  }

  /// 📅 Pick Date
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      selectedDate = picked;
      _applyFilters();
    }
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }

  /// 🧾 Complaint Card
  Widget _complaintCard(Map<String, dynamic> item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Row(
          children: [
            Text(
              "Complaint #${item['id']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            _statusChip(item['status']),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rowText("App", item['appName']),
              _rowText("Order ID", item['orderId']),
              _rowText("Issue", item['issue']),
              _rowText("Date", item['date']),
            ],
          ),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Open Complaint #${item['id']}"),
            ),
          );
        },
      ),
    );
  }

  /// 🟢 Status Chip
  Widget _statusChip(String status) {
    Color color;
    switch (status) {
      case "Pending":
        color = Colors.orange;
        break;
      case "In Progress":
        color = Colors.blue;
        break;
      case "Resolved":
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  /// 🔹 Key-Value Row
  Widget _rowText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 13),
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  /// 💤 Empty View
  Widget _emptyView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.support_agent, size: 80, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            "No Complaints Found",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
