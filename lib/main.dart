import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disposable Paper Cups Awareness',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Show error if either field is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter both username and password."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        color: Colors.green.shade50, // Light green background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome, please log in!",
                style: TextStyle(fontSize: 24, color: Colors.green.shade700)),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade700),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green.shade700),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("Log In", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Disposable Paper Cups Awareness"),
      ),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.green.shade50, // Light background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Sustainability App!',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade700),
            ),
            SizedBox(height: 20),
            _buildActionButton(
                context,
                'Learn About Health & Environmental Impacts',
                AwarenessScreen()),
            SizedBox(height: 20),
            _buildActionButton(
                context, 'Scan Your Plastic Cup', RewardsScreen()),
            SizedBox(height: 20),
            _buildActionButton(
                context, 'Track Your Actions & Earn Rewards', RewardsScreen()),
            SizedBox(height: 20),
            _buildActionButton(context, 'See Your Impact', ImpactScreen()),
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildActionButton(
      BuildContext context, String text, Widget destination) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade600,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}

class AwarenessScreen extends StatelessWidget {
  final List<String> facts = [
    "Disposable paper cups contribute to microplastic pollution.",
    "BPA and phthalates in paper cups can leach into beverages, increasing cancer risk.",
    "Over 300 million paper cups are thrown away each year in the US alone.",
    "Switching to reusable cups can help reduce environmental waste significantly.",
    "Over 500 billion paper cups are used globally each year, contributing to a significant waste crisis.",
    "Each disposable paper cup takes years to break down in a landfill due to its plastic lining.",
    "Most paper cups cannot be recycled because of the plastic coating that keeps liquids from leaking.",
    "The production of paper cups requires large amounts of water and energy, further contributing to environmental degradation.",
    "Switching to a reusable cup can save the average person hundreds of disposable cups every year.",
    "Microplastics from paper cups can enter our food chain, affecting both wildlife and human health.",
    "It takes approximately 1,000 years for a paper cup to decompose fully in a landfill.",
    "By using a reusable cup, you can reduce your carbon footprint by avoiding the production of new paper cups.",
    "The chemicals in paper cups can affect water quality, harming aquatic ecosystems when they break down.",
    "The environmental impact of paper cups is comparable to plastic, contributing to the growing issue of single-use plastics."
  ];

  final List<String> imageUrls = [
    'https://media.wired.com/photos/64f11710a45d365f6340e67f/master/w_1920,c_limit/papercups-science-GettyImages-918866470-(1).jpg',
    // Add more URLs here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Health and Environmental Impacts")),
      body: Container(
        color: Colors.green.shade50, // Light green background
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: facts.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(imageUrls[index],
                      width: 60, height: 60, fit: BoxFit.cover),
                ),
                title: Text(
                  facts[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  int points = 0;
  double co2Saved = 0.0;
  String scanResult = "";

  final Map<String, String> barcodeTypes = {
    "123456789": "This is a plastic cup!",
    "987654321": "This is a reusable cup!",
    "112233445": "This is a compostable cup!",
    "998877665": "This is a ceramic cup!"
  };

  void _earnPoints() {
    setState(() {
      points += 10;
    });
  }

  Future<void> _scanCup() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.type == ResultType.Barcode) {
        String cupInfo = result.rawContent;
        _checkCupType(cupInfo);
      }
    } catch (e) {
      print("Scan failed: $e");
    }
  }

  void _checkCupType(String cupInfo) {
    setState(() {
      if (barcodeTypes.containsKey(cupInfo)) {
        scanResult = barcodeTypes[cupInfo]!;
        if (cupInfo == "123456789") {
          co2Saved -= 0.2; // CO2 penalty for plastic
        } else if (cupInfo == "987654321") {
          co2Saved += 0.5; // CO2 saved for reusable
          points += 20; // Reward points for reusable cups
        } else if (cupInfo == "112233445") {
          co2Saved += 0.3; // CO2 saved for compostable cups
          points += 15; // Points for compostable cups
        } else if (cupInfo == "998877665") {
          co2Saved += 0.4; // CO2 saved for ceramic cups
          points += 25; // Points for ceramic cups
        }
      } else {
        scanResult = "Cup type not recognized!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Track Your Progress")),
      body: Container(
        color: Colors.green.shade50, // Light green background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Points: $points",
                style: TextStyle(fontSize: 24, color: Colors.green.shade700)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanCup,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("Scan Your Cup", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Text("CO2 Saved: $co2Saved kg", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(scanResult, style: TextStyle(fontSize: 18, color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

class ImpactScreen extends StatelessWidget {
  final double carbonSaved = 2.5;
  final int cupsAvoided = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Impact")),
      body: Container(
        color: Colors.green.shade50, // Light green background
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Impact Summary",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700)),
            SizedBox(height: 20),
            Text("Cups Avoided: $cupsAvoided", style: TextStyle(fontSize: 20)),
            Text("CO2 Saved: $carbonSaved kg", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green.shade700,
            ),
            child: Text(
              'Sustainability App',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {
              // Add Profile functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              // Add Dashboard functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Add Settings functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Navigate back to login page when logged out
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
