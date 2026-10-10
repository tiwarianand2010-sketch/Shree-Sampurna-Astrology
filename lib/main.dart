import 'package:flutter/material.dart';

void main() {
  runApp(const ShreeSampurnaAstrologyApp());
}

class ShreeSampurnaAstrologyApp extends StatelessWidget {
  const ShreeSampurnaAstrologyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shree Sampurna Astrology',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEDF5FC), // Light Blue
        primaryColor: const Color(0xFFD1A640), // Royal Gold
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD1A640),
          primary: const Color(0xFFD1A640),
          surface: Colors.white,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final DateTime _selectedDate = DateTime.now();
  int _selectedHouse = 1;
  String _selectedPlanet = 'लग्नेश';
  double _ayanamsha = 0.0;
  List<Map<String, String>> _predictions = [];

  final List<String> _planets = [
    'लग्नेश',
    'सूर्य',
    'चंद्र',
    'मंगल',
    'बुध',
    'गुरु',
    'शुक्र',
    'शनि'
  ];

  void _calculateAndPredict() {
    double year = _selectedDate.year.toDouble();
    double dayOfYear = _selectedDate.difference(DateTime(_selectedDate.year, 1, 1)).inDays.toDouble();
    double t = (year + (dayOfYear / 365.25) - 1900.0) / 100.0;
    
    setState(() {
      _ayanamsha = 22.46 + (1.396 * t);
      _predictions = [
        {
          'book': 'बृहत् पराशर होरा शास्त्र',
          'chapter': 'अध्याय 11 • श्लोक 1',
          'sanskrit': 'लग्नेशे लग्नगे वापि देहसौख्यं महद् भवेत्। बलवान् धनधान्याढ्यो यशस्वी गुणवान् भवेत्॥',
          'hindi': 'यदि लग्नेश प्रथम भाव (लग्न) में ही स्थित हो, तो जातक को संपूर्ण शारीरिक सुख प्राप्त होता है। वह बलवान, धन-धान्य से संपन्न, यशस्वी और गुणी होता है।'
        },
        {
          'book': 'फलदीपिका',
          'chapter': 'अध्याय 8 • श्लोक 1',
          'sanskrit': 'सूर्ये लग्ने यदा जातस्तस्य कान्तिर्भवेन्नरा। नेत्ररोगी चाल्पकेशी तनुता च प्रजायते॥',
          'hindi': 'यदि सूर्य लग्न भाव में स्थित हो, तो जातक तेजस्वी और प्रभावशाली व्यक्तित्व वाला होता है, परंतु उसे नेत्र या बालों से संबंधित सामान्य समस्याएँ हो सकती हैं।'
        },
        {
          'book': 'सारावली',
          'chapter': 'अध्याय 21 • श्लोक 5',
          'sanskrit': 'पूर्णेन्दौ लग्नसंस्थे तु सुरूपः सुभगो भवेत्। स्थिरचित्तः सुखाचारी दीर्घायुश्च नरो भवेत्॥',
          'hindi': 'यदि पूर्ण चंद्रमा लग्न भाव में स्थित हो, तो मनुष्य अत्यंत सुंदर, भाग्यशाली, स्थिर बुद्धि वाला, सुखद आचरण करने वाला और दीर्घायु होता है।'
        },
        {
          'book': 'उत्तर कलामृत',
          'chapter': 'खण्ड 4 • श्लोक 12',
          'sanskrit': 'भाग्यं धर्मं गुरुं तीर्थं भक्तिं शुद्धिं मनोगतम्। नवमाद्भावतः सर्वं विचार्यं मतिमता सदा॥',
          'hindi': 'नवम भाव से भाग्य, धर्म, गुरु, तीर्थयात्रा, ईश्वर भक्ति, और मन की पवित्रता का विचार विद्वान ज्योतिषी को सदैव करना चाहिए।'
        }
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Card
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD1A640).withOpacity(0.4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFD1A640), width: 2.5),
                        image: const DecorationImage(
                          image: AssetImage('assets/ic_launcher.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'श्री संपूर्ण एस्ट्रोलॉजी',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA67C1E),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'राष्ट्रीय पंचांग, सूर्य सिद्धांत एवं पराशर सिद्धांत आधारित',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Light Red Input Form
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD1A640).withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAlignment.start,
                  children: [
                    const Text(
                      'कुण्डली फलादेश निर्णय',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFA67C1E)),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _nameController,
                      style: const TextStyle(color: Color(0xFF8B0000), fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        labelText: 'जातक का नाम दर्ज करें',
                        labelStyle: const TextStyle(color: Color(0xFFB71C1C)),
                        filled: true,
                        fillColor: const Color(0xFFFFEBEE), // Light Red Background
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFEF9A9A), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFE57373), width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<int>(
                            value: _selectedHouse,
                            decoration: InputDecoration(
                              labelText: 'भाव',
                              filled: true,
                              fillColor: const Color(0xFFFFEBEE),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            items: List.generate(12, (index) => index + 1)
                                .map((h) => DropdownMenuItem(value: h, child: Text('भाव $h')))
                                .toList(),
                            onChanged: (val) => setState(() => _selectedHouse = val!),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedPlanet,
                            decoration: InputDecoration(
                              labelText: 'ग्रह',
                              filled: true,
                              fillColor: const Color(0xFFFFEBEE),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            items: _planets
                                .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                                .toList(),
                            onChanged: (val) => setState(() => _selectedPlanet = val!),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD1A640),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: _calculateAndPredict,
                        child: const Text(
                          'सटीक फलादेश देखें',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              if (_ayanamsha > 0) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE1EFFB),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFD1A640).withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.menu_book, color: Color(0xFFA67C1E)),
                      const SizedBox(width: 8),
                      Text(
                        'लाहिड़ी अयानांश: ${_ayanamsha.toStringAsFixed(2)}°',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFA67C1E)),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 20),

              if (_predictions.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAlignment.start,
                  children: [
                    const Text(
                      'शास्त्रोक्त श्लोक एवं फलादेश:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFA67C1E)),
                    ),
                    const SizedBox(height: 10),
                    ..._predictions.map((p) => Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: Border.all(color: const Color(0xFFD1A640).withOpacity(0.3)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFD1A640).withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        p['book']!,
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFA67C1E)),
                                      ),
                                    ),
                                    Text(p['chapter']!, style: const TextStyle(fontSize: 10, color: Colors.grey)),
                                  ],
                                ),
                                const Divider(),
                                const Text('मूल संस्कृत श्लोक:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                                const SizedBox(height: 4),
                                Text(
                                  p['sanskrit']!,
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF5C3A00), height: 1.3),
                                ),
                                const Divider(),
                                const Text('प्रामाणिक हिंदी फलादेश:', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                                const SizedBox(height: 4),
                                Text(p['hindi']!, style: const TextStyle(fontSize: 13, height: 1.3)),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
