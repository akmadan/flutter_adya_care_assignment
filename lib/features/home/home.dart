import 'package:adyacare_assignment/features/video_player/ui/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://uploads-ssl.webflow.com/63dca1df3f26885fe13987e6/63dca27c0b558cb78bfd46e5_adya-header-logo-893ec57a37fc49316f55d03365b2ae47-p-500.webp'))),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 60, top: 10),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://uploads-ssl.webflow.com/63dca1df3f26885fe13987e6/63dca25ce1e0ce737ebeb72b_Landing%20page%20lady.png'))),
                ),
              ),
              const Text(
                'Adya solves the BIG missing piece in Cancer Care – a scalable, clinical pathway to accelerate resiliency & rehabilitation.',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoPlayerPage()));
                    },
                    child: const Text('Check Assignment')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
