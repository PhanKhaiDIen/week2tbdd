import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Phan loai tuoi',
      home: const AgeCheckScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AgeCheckScreen extends StatefulWidget {
  const AgeCheckScreen({super.key});

  @override
  State<AgeCheckScreen> createState() => _AgeCheckScreenState();
}

class _AgeCheckScreenState extends State<AgeCheckScreen> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _ageController=TextEditingController();
  String _result="";

  String classifyAge(int age){
    if (age<=2) return "Em be";
    if (age<=6) return "Tre em";
    if (age<=65) return "Nguoi lon";
    return "Nguoi gia";
  }

  void _kiemTra(){
    String name= _nameController.text.trim();
    String ageStr=_ageController.text.trim();
    if(name.isEmpty || ageStr.isEmpty){
      setState(() {
        _result="Vui long nhap day du ho ten va tuoi";
      });
      return;
    }
    int? age=int.tryParse(ageStr);
    if (age == null || age < 0){
      setState(() {
        _result= "Tuoi khong hop le";
      });
      return;
    }
    setState(() {
      String category = classifyAge(age!);
      _result= "Ho ten: $name\nTuoi: $age\nPhan loai :$category";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "THỰC HÀNH 01",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                            width: 80, child: Text("Ho va Ten")),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 80, child: Text("Tuoi")),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _kiemTra,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text("Kiểm tra"),
              ),
              const SizedBox(height: 20),
              Text(
                _result,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

    