import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(Iconsax.user_tick),
            ),
            title: Text('Name'),
            subtitle: Text('example@gmail.com'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    'General',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 21,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Iconsax.user),
                    ),
                  ),
                  title: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 20),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 21,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Iconsax.lock_1),
                    ),
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    'Support',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 21,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Iconsax.support),
                    ),
                  ),
                  title: Text(
                    'Help & Support',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 20),
                const ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 21,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Iconsax.information),
                    ),
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: TextButton(
                      style: TextButton.styleFrom(
                          side: BorderSide(width: 2, color: Colors.red),
                          foregroundColor: Colors.red),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                )
              ],
            ),
          )

          // Center(
          //   child: Column(children: [
          //     ListTile(
          //       leading: CircleAvatar(
          //         backgroundColor: Colors.green,
          //       ),
          //       title: Text('Name'),
          //       subtitle: Text('example@gmail.com'),
          //     )
          //   ]),
          // ),
          // Text('data')
        ],
      ),
    );
  }
}
