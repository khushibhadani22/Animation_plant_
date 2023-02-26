import 'package:flutter/material.dart';

class DetailS extends StatefulWidget {
  const DetailS({Key? key}) : super(key: key);

  @override
  State<DetailS> createState() => _DetailSState();
}

class _DetailSState extends State<DetailS> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10000),
      lowerBound: 0,
      upperBound: 1,
      reverseDuration: const Duration(milliseconds: 10000),
    );
    super.initState();
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/image/uni.jpg").image,
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Text(
                    "${data['name']}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              RotationTransition(
                turns: animationController,
                child: Hero(
                  tag: data['name'],
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: Image.asset(
                          "${data['image']}",
                          fit: BoxFit.cover,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff252648).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Text(
                  "${data['details']} Gravity : ${data['gravity']}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
