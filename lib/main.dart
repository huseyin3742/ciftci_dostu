import 'package:flutter/material.dart';
import 'services/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Çiftçi Dostu',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? weatherData;
  final WeatherService weatherService = WeatherService();

  String city = 'Konya';
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    if (city.trim().isEmpty) return;
    final data = await weatherService.getWeather(city);
    print('ICON: ${data?['weather']?[0]?['icon']}');
    setState(() {
      weatherData = data;
    });
  }

  Map<String, dynamic> getRecommendation() {
    final double temp = weatherData!['main']['temp'];
    final String condition = weatherData!['weather'][0]['main'];

    if (condition == 'Rain') {
      return {
        'text': 'Bugün yağmur var. İlaçlama yapmayın.',
        'color': Colors.blue
      };
    } else if (condition == 'Snow' || temp < 5) {
      return {
        'text': 'Hava çok soğuk, don riski olabilir!',
        'color': Colors.red
      };
    } else if (temp > 30) {
      return {
        'text': 'Hava çok sıcak. Sulamayı sabah erken saatlerde yapın.',
        'color': Colors.orange
      };
    } else {
      return {
        'text':
            'Hava koşulları normal. Tarım faaliyetlerine devam edebilirsiniz.',
        'color': Colors.green
      };
    }
  }

  String getRecommendationIcon() {
    final double temp = weatherData!['main']['temp'];
    final String condition = weatherData!['weather'][0]['main'];

    if (condition == 'Rain') return '🌧️';
    if (condition == 'Snow' || temp < 5) return '❄️';
    if (temp > 30) return '🔥';
    return '🌤️';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çiftçi Dostu'),
        centerTitle: true,
        backgroundColor: Colors.green.withOpacity(0.7),
      ),
      body: Stack(
        children: [
          // Arka plan
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/yesil_tarla.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Ortalanmış içerik kutusu
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 400),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hoş Geldiniz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(blurRadius: 6, color: Colors.black)],
                        ),
                      ),
                      SizedBox(height: 20),

                      if (weatherData == null)
                        CircularProgressIndicator()
                      else
                        Card(
                          color: Colors.white.withOpacity(0.9),
                          child: ListTile(
                            leading: Image.network(
                              'https://openweathermap.org/img/wn/${weatherData!['weather'][0]['icon']}@2x.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text('${weatherData!['main']['temp']}°C'),
                            subtitle: Text(
                                '${weatherData!['weather'][0]['description']}'),
                            trailing: Text('${weatherData!['name']}'),
                          ),
                        ),
                      SizedBox(height: 16),

                      // Şehir arama
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _cityController,
                              decoration: InputDecoration(
                                hintText: 'Şehir girin (örn: Ankara)',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              setState(() {
                                city = _cityController.text;
                              });
                              fetchWeather();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                            ),
                            child: Text('Getir'),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      if (weatherData != null) ...[
                        Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: getRecommendation()['color']
                                .withOpacity(0.85),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.info, color: Colors.white),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  '${getRecommendationIcon()} ${getRecommendation()['text']}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
