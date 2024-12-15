import 'package:cloud_firestore/cloud_firestore.dart'; // Tambahkan ini
import 'package:firebase_auth/firebase_auth.dart'; // Tambahkan ini
import 'package:flutter/material.dart';
import 'package:flutter_aplikasi_surah_test/services/auth_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_aplikasi_surah_test/globals.dart';
import 'package:flutter_aplikasi_surah_test/tabs/hijb_tab.dart';
import 'package:flutter_aplikasi_surah_test/tabs/page_tab.dart';
import 'package:flutter_aplikasi_surah_test/tabs/para_tab.dart';
import 'package:flutter_aplikasi_surah_test/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Fungsi untuk mengambil nama lengkap pengguna dari Firestore
  Future<String> _getUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        return userDoc['name'] ?? 'Pengguna'; // Default jika nama tidak ada
      } else {
        return 'Pengguna';
      }
    } catch (e) {
      return 'Pengguna';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(context),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: FutureBuilder<String>(
                        future: _getUserName(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return _greeting(name: "Memuat..."); // Menampilkan loading
                          } else if (snapshot.hasError) {
                            return _greeting(name: "Kesalahan");
                          } else {
                            return _greeting(name: snapshot.data ?? "Pengguna");
                          }
                        },
                      ),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      backgroundColor: background,
                      automaticallyImplyLeading: false,
                      shape: Border(
                          bottom: BorderSide(
                              width: 3,
                              color: const Color(0xFFAAAAAA).withOpacity(.1))),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: _tab(),
                      ),
                    )
                  ],
              body: const TabBarView(
                  children: [SurahTab(), ParaTab(), PageTab(), HijbTab()])),
        ),
      ),
    );
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: text,
        labelColor: const Color(0xFF240F4F),
        indicatorColor: primary,
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Surah"),
          _tabItem(label: "Akan Datang"),
          _tabItem(label: "Akan Datang"),
          _tabItem(label: "Akan Datang"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  // Ubah _greeting agar menerima nama sebagai parameter
  Column _greeting({required String name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.w500, color: text),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name, // Tampilkan nama pengguna
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w600, color: const Color(0xFF240F4F)),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0,
                    .6,
                    1
                  ],
                  colors: [
                    Color(0xFF97B9FF),
                    Color(0xFF5F9BFF),
                    Color(0xFF1B89DD)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svgs/quran.svg')),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Terakhir Dibaca',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFF240F4F), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF240F4F),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Ayat No: 1',
                style: GoogleFonts.poppins(
                  color: const Color(0xFF240F4F),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        backgroundColor: background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(children: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/menu-icon.svg')),
          const SizedBox(
            width: 24,
          ),
          Text(
            'Aplikasi Surah',
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1B89DD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            onPressed: () async {
              await AuthService().signout(context: context);
            },
            child: const Text(
              "Keluar",
              style: TextStyle(color: Color(0xFF121931)),
            ),
          ),
        ]),
      );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
          _bottomBarItem(
              icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
        ],
      );

  BottomNavigationBarItem _bottomBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(text, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(primary, BlendMode.srcIn),
          ),
          label: label);
}
