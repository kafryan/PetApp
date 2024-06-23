// ignore_for_file: annotate_overrides

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenge/Models/doctor_model.dart';
import 'package:flutterchallenge/Models/service_model.dart';
import 'package:google_fonts/google_fonts.dart';

var selectedService = 0;

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: _card,
        )),
      ),
    );
  }

  List<Widget> get _card {
    return [
      const SizedBox(
        height: 20,
      ),
      _greetings(),
      const SizedBox(
        height: 16,
      ),
      _cardd(),
      const SizedBox(
        height: 20,
      ),
      _search(),
      const SizedBox(
        height: 20,
      ),
      _services(),
      const SizedBox(
        height: 20,
      ),
      _doctors()
    ];
  }

  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
        padding: const EdgeInsetsDirectional.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF35385A).withOpacity(.12),
                  blurRadius: 30,
                  offset: const Offset(0, 2))
            ]),
        child: Row(children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                'assets/images/${doctorModel.image}',
                height: 103,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3F3E3F)),
                ),
                const SizedBox(
                  height: 7,
                ),
                RichText(
                    text: TextSpan(
                        text: "Service: ${doctorModel.service.join(', ')}",
                        style: GoogleFonts.manrope(
                            fontSize: 12, color: Colors.black))),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.mapPin,
                      size: 14,
                      color: Color(0xFFACA3A3),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text("${doctorModel.distance} km",
                        style: GoogleFonts.manrope(
                          fontSize: 12,
                          color: const Color(0xFFACA3A3),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 25,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Text(
                        "Available for",
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF50CC98),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/svgs/cat.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset('assets/svgs/dog.svg'),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }

  Widget _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() => selectedService = index);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: selectedService == index
                          ? const Color(0xFF818AF9)
                          : const Color(0xFFF6F6F6),
                      border: selectedService == index
                          ? Border.all(
                              color: const Color(0xFFF1E5E5).withOpacity(.22))
                          : null,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(Service.all()[index],
                          style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedService == index
                                  ? Colors.white
                                  : const Color(0xFF3F3E3F).withOpacity(.3)))),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: Service.all().length),
    );
  }

  Widget _cardd() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_cat.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: "Your ",
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              color: const Color(0xFFDEE1FE),
                              height: 150 / 100),
                          children: const [
                            TextSpan(
                                text: "CutiePie ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                            TextSpan(text: "will get\nvaccination "),
                            TextSpan(
                                text: "tomorrow\nat 07.00 am! ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800)),
                          ])),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4),
                      border: Border.all(
                          color: Colors.white.withOpacity(.12), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'See details',
                        style: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              FeatherIcons.search,
              color: Color(0xFFADACAD),
            ),
            hintText: 'Find your best vaccinate, treatment...',
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFCACACA),
                height: 150 / 100)),
      ),
    );
  }

  Widget _greetings() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hello, Hooman!',
                style: GoogleFonts.manrope(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF3F3E3F))),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xFF818AF9),
                ))
          ],
        ));
  }
}
