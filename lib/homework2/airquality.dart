import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AQIPage extends StatefulWidget {
  const AQIPage({super.key});

  @override
  _AQIPageState createState() => _AQIPageState();
}

class _AQIPageState extends State<AQIPage> {
  int aqi = 0;
  String city = '';
  String status = '';
  double temperature = 0;
  int humidity = 0;
  int pressure = 0;
  double windSpeed = 0;

  Future<void> fetchAQI() async {
    final response = await http.get(
      Uri.parse(
          'https://api.waqi.info/feed/bangkok/?token=0f5d46dea91d875c66996b71ccca1bd75aa026f0'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        aqi = data['data']['aqi'];
        city = data['data']['city']['name'];
        temperature = (data['data']['iaqi']['t']?['v'] ?? 0).toDouble();
        humidity = (data['data']['iaqi']['h']?['v'] ?? 0).toInt();
        pressure = (data['data']['iaqi']['p']?['v'] ?? 0).toInt();
        windSpeed = (data['data']['iaqi']['w']?['v'] ?? 0).toDouble();
        status = _getAQIStatus(aqi!);
      });
    } else {
      throw Exception('Failed to load AQI data');
    }
  }

  Color _getColor(int aqi) {
    if (aqi <= 50) {
      return Color.fromARGB(255, 34, 139, 34);
    } else if (aqi <= 100) {
      return const Color.fromARGB(255, 217, 163, 0);
    } else if (aqi <= 150) {
      return const Color.fromARGB(210, 233, 117, 71);
    } else if (aqi <= 200) {
      return const Color.fromARGB(221, 195, 15, 15);
    } else if (aqi <= 300) {
      return const Color.fromARGB(255, 127, 0, 127);
    } else {
      return const Color.fromARGB(255, 127, 0, 63);
    }
  }

  String _getAQIStatus(int aqi) {
    if (aqi <= 50) {
      return "AQI - Good 😊";
    } else if (aqi <= 100) {
      return "AQI - Moderate 😐";
    } else if (aqi <= 150) {
      return "AQI - Unhealthy for Sensitive Groups 😷";
    } else if (aqi <= 200) {
      return "AQI - Unhealthy ⚠️";
    } else if (aqi <= 300) {
      return "AQI - Very Unhealthy 🚨";
    } else {
      return "AQI - Hazardous ☠️";
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAQI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getColor(aqi!),
      appBar: AppBar(
        title: const Text('Air Quality Index'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // จัดชิดซ้าย
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '$city',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Text(
                    '$aqi',
                    style: const TextStyle(
                        fontSize: 130,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Text(
                    '$status',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _weatherData("$temperature°C", Icons.thermostat),
                  _weatherData("$humidity%", Icons.water_drop),
                  _weatherData("$pressure hPa", Icons.speed),
                  _weatherData("$windSpeed km/h", Icons.air),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: GestureDetector(
                onTap: fetchAQI,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.refresh, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Refresh",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weatherData(String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: _getColor(aqi!)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
