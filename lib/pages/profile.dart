import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Contact Us'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get in Touch',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              const SizedBox(height: 20),

              // Input Form for User
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Message',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.message),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 20),

              // Button to send message
              ElevatedButton(
                onPressed: () {
                  // Show AlertDialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Message Sent!'),
                        content: const Text(
                            'Your message has been sent successfully.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog

                              // Show Custom Snackbar after closing the dialog
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(Icons.check,
                                          color: Colors.white), // Icon
                                      const SizedBox(width: 8), // Spacer
                                      const Expanded(
                                        child: Text(
                                          'Thank you for your message!',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  backgroundColor:
                                      Colors.green, // Snackbar color
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Send Message'),
              ),
              const SizedBox(height: 40),

              // Info Section with Icons (Static)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.email),
                      const Text('Email'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.phone),
                      const Text('Call Us'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.location_on),
                      const Text('Location'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
