import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: double.maxFinite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            // border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/60/60"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Aziz",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
                            ),
                            Text("+998001112233", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.chevron_right, color: Colors.black),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Items
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [Icon(Icons.message_outlined), SizedBox(width: 8), Text("Qo'llab quvvatlash")]),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [Icon(Icons.dark_mode), SizedBox(width: 8), Text("Qorong'u rejim")]),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [Icon(Icons.notifications), SizedBox(width: 8), Text("Bildirishnomalar")]),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  // border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_2, color: Colors.purple),
                        SizedBox(width: 8),
                        Text("Admin paneli", style: TextStyle(color: Colors.purple)),
                      ],
                    ),
                    Icon(Icons.chevron_right, color: Colors.purple),
                  ],
                ),
              ),
              SizedBox(height: 50),

              GestureDetector(
                onTap: () {},
                // style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.purple)),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.purple),
                  child: Center(
                    child: Text(
                      "Hisobdan chiqish",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
