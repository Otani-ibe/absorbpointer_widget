import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AbsorbPointer Demo',
      // This is the corrected theme section.
      // It uses colorScheme and NOT primarySwatch.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AbsorbPointerDemoScreen(),
    );
  }
}

class AbsorbPointerDemoScreen extends StatefulWidget {
  const AbsorbPointerDemoScreen({super.key});

  @override
  State<AbsorbPointerDemoScreen> createState() =>
      _AbsorbPointerDemoScreenState();
}

class _AbsorbPointerDemoScreenState extends State<AbsorbPointerDemoScreen> {
  // This boolean controls the loading state and the AbsorbPointer.
  bool _isLoading = false;

  // Simulates a network request or data processing.
  void _submitForm() {
    setState(() {
      _isLoading = true;
    });

    // After a 3-second delay, reset the state and show a confirmation.
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsorbPointer Demo'),
        // Use colors from the generated color scheme for a consistent look.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Stack allows us to overlay the loading spinner on top of the form.
      body: Stack(
        children: [
          // This widget absorbs pointer events when _isLoading is true.
          AbsorbPointer(
            // PROPERTY 1: When true, this widget absorbs touch events.
            absorbing: _isLoading,

            // PROPERTY 2: Hides the child from screen readers when absorbing.
            ignoringSemantics: _isLoading,

            // PROPERTY 3: The widget tree that will be affected.
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Try submitting the form. The UI will be disabled for 3 seconds.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        // Use the theme's colors for the button.
                        backgroundColor: _isLoading
                            ? Colors.grey
                            : Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(
                          context,
                        ).colorScheme.onPrimary,
                      ),
                      // If loading, onPressed is null, which disables the button.
                      onPressed: _isLoading ? null : _submitForm,
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Show a loading spinner only when _isLoading is true.
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
