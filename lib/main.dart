import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Restart experiment:
  // Change this message, save, and try Hot Reload. main() will not run again.
  // Use Hot Restart to see the changed message printed in the Debug Console.
  debugPrint('APP STARTUP: Week 2 Hello World');

  runApp(const Week2HelloApp());
}

class Week2HelloApp extends StatelessWidget {
  const Week2HelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 2 - Hello World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF315DA8),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF315DA8),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HelloCounterScreen(),
    );
  }
}

class HelloCounterScreen extends StatefulWidget {
  const HelloCounterScreen({super.key});

  @override
  State<HelloCounterScreen> createState() => _HelloCounterScreenState();
}

class _HelloCounterScreenState extends State<HelloCounterScreen> {
  int _counter = 0;
  int _buildCount = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('HelloCounterScreen.initState()');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter == 0) return;

    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buildCount++;
    debugPrint(
      'HelloCounterScreen.build() #$_buildCount | counter=$_counter',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 2 | Hello World'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.waving_hand_rounded,
                  size: 64,
                  color: Color(0xFF315DA8),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Hello World',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF17243A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'My first Flutter screen',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.blueGrey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 32),
                Card(
                  elevation: 1,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          'STATEFUL COUNTER',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF315DA8),
                                  ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '$_counter',
                          key: const ValueKey('counterValue'),
                          style: const TextStyle(
                            fontSize: 52,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF17243A),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            OutlinedButton.icon(
                              onPressed:
                                  _counter > 0 ? _decrementCounter : null,
                              icon: const Icon(Icons.remove),
                              label: const Text('Decrease'),
                            ),
                            FilledButton.icon(
                              key: const ValueKey('incrementButton'),
                              onPressed: _incrementCounter,
                              icon: const Icon(Icons.add),
                              label: const Text('Increase'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: _resetCounter,
                          child: const Text('Reset counter'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Build method calls: $_buildCount',
                  key: const ValueKey('buildCount'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.blueGrey.shade600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Try changing the Hello World font size, then use Hot Reload.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('HelloCounterScreen.dispose()');
    super.dispose();
  }
}
