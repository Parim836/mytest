import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mytest/model/AirQuality.dart';

class AirQualityScreen extends StatefulWidget {
  const AirQualityScreen({super.key});

  @override
  State<AirQualityScreen> createState() => _AirQualityScreenState();
}

class _AirQualityScreenState extends State<AirQualityScreen> {
  AirQuality? airQuality;
  bool isLoading = false;

  Future<void> fetchAQI() async {
    setState(() => isLoading = true);

    try {
      final response = await http.get(
        Uri.parse(
            'https://api.waqi.info/feed/bangkok/?token=0f5d46dea91d875c66996b71ccca1bd75aa026f0'),
      );

      if (response.statusCode == 200) {
        setState(() {
          airQuality = AirQuality.fromJson(jsonDecode(response.body));
        });
      } else {
        print('Error fetching data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  String getAirQualityMessage(int aqi) {
    if (aqi <= 50) {
      return "Air quality is Good 😊";
    } else if (aqi <= 100) {
      return "Air quality is Moderate 😐";
    } else if (aqi <= 150) {
      return "Unhealthy for Sensitive Groups 😷";
    } else if (aqi <= 200) {
      return "Unhealthy ⚠️";
    } else if (aqi <= 300) {
      return "Very Unhealthy 🚨";
    } else {
      return "Hazardous ☠️";
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text('Air Quality Index'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : airQuality == null
                ? const Text('No data available')
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Bangkok',
                          style: TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(255, 89, 89, 89)),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 220, // เพิ่มขนาดความกว้าง
                          height: 220, // เพิ่มขนาดความสูง
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 232, 161, 161),
                                  blurRadius: 20,
                                  spreadRadius: 15)
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'PM2.5',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                airQuality!.aqi.toString(),
                                style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 232, 161, 161)),
                              ),
                              const Text(
                                'µg/m3',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                getAirQualityMessage(airQuality!.aqi),
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildInfoCard(
                                'Temperature',
                                '${airQuality!.temperature}°C',
                                Icons.thermostat),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: fetchAQI,
                          child: const Text("Refresh"),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12)],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.blue, size: 32),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
