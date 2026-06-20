import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key});

      @override
        Widget build(BuildContext context) {
            return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                        home: HomePage(),
                            );
                              }
                              }

                              class HomePage extends StatefulWidget {
                                const HomePage({super.key});

                                  @override
                                    State<HomePage> createState() => _HomePageState();
                                    }

                                    class _HomePageState extends State<HomePage> {
                                      int minutes = 0;
                                        int dailyGoal = 60;
                                          List<String> history = [];

                                            void addTime() {
                                                setState(() {
                                                      minutes += 10;
                                                            history.insert(0, "Added 10 min → $minutes min");
                                                                });
                                                                  }

                                                                    double getProgress() {
                                                                        return (minutes / dailyGoal).clamp(0.0, 1.0);
                                                                          }

                                                                            String getStatus() {
                                                                                if (minutes < 30) return "On Track 👍";
                                                                                    if (minutes < 60) return "Warning ⚠️";
                                                                                        return "Over Limit 🚨";
                                                                                          }

                                                                                            Color getColor() {
                                                                                                if (minutes < 30) return Colors.green;
                                                                                                    if (minutes < 60) return Colors.orange;
                                                                                                        return Colors.red;
                                                                                                          }

                                                                                                            @override
                                                                                                              Widget build(BuildContext context) {
                                                                                                                  return Scaffold(
                                                                                                                        appBar: AppBar(title: const Text("Focus Tracker")),
                                                                                                                              body: Padding(
                                                                                                                                      padding: const EdgeInsets.all(16),
                                                                                                                                              child: Column(
                                                                                                                                                        children: [
                                                                                                                                                                    Text("Screen Time: $minutes min",
                                                                                                                                                                                    style: const TextStyle(fontSize: 22)),

                                                                                                                                                                                                const SizedBox(height: 10),

                                                                                                                                                                                                            LinearProgressIndicator(
                                                                                                                                                                                                                          value: getProgress(),
                                                                                                                                                                                                                                        color: getColor(),
                                                                                                                                                                                                                                                    ),

                                                                                                                                                                                                                                                                const SizedBox(height: 10),

                                                                                                                                                                                                                                                                            Text(getStatus(), style: TextStyle(color: getColor())),

                                                                                                                                                                                                                                                                                        const SizedBox(height: 10),

                                                                                                                                                                                                                                                                                                    ElevatedButton(
                                                                                                                                                                                                                                                                                                                  onPressed: addTime,
                                                                                                                                                                                                                                                                                                                                child: const Text("Add 10 min"),
                                                                                                                                                                                                                                                                                                                                            ),

                                                                                                                                                                                                                                                                                                                                                        const SizedBox(height: 20),

                                                                                                                                                                                                                                                                                                                                                                    const Text("History"),

                                                                                                                                                                                                                                                                                                                                                                                Expanded(
                                                                                                                                                                                                                                                                                                                                                                                              child: ListView.builder(
                                                                                                                                                                                                                                                                                                                                                                                                              itemCount: history.length,
                                                                                                                                                                                                                                                                                                                                                                                                                              itemBuilder: (context, index) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                return ListTile(
                                                                                                                                                                                                                                                                                                                                                                                                                                                                    title: Text(history[index]),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      },
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            );
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              }