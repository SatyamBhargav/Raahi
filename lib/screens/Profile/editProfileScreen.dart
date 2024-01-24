import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(),
              const SizedBox(height: 20),
              Text(
                'name',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Tooltip(
                          message: 'Download Your Passwords',
                          waitDuration: Duration(milliseconds: 0),
                          child: Icon(
                            Icons.info_rounded,
                            size: 30,
                          ),
                        ),
                        title: Text(
                          'Download',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        trailing: IconButton(
                            onPressed: null,
                            icon: const Icon(
                              Icons.download,
                              size: 30,
                            )),
                      ),
                      const SizedBox(height: 20),

                      // const SizedBox(height: 20),
                      // Text(
                      //     MediaQuery.of(context).size.height.toStringAsFixed(2),
                      //     style: Theme.of(context).textTheme.titleMedium),
                      // const SizedBox(height: 20),
                      // Text(MediaQuery.of(context).size.width.toStringAsFixed(2),
                      //     style: Theme.of(context).textTheme.titleMedium)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
