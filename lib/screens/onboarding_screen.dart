import 'package:agency/screens/home_nft_screen.dart';
import 'package:agency/widgets/app_logo.dart';
import 'package:agency/widgets/event_stat.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:agency/animation/animations.dart';
import 'package:agency/constants/constants.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/onboard';
  const OnBoardingScreen({Key? key}) : super(key: key);

  final double _padding = 40;
  final _headingStyle = const TextStyle(
    fontWeight: FontWeight.w200,
    fontFamily: 'Dsignes',
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: const _AppBar(),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                0.4,
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/flash.svg',
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Demarrer',
                      style: TextStyle(
                        fontSize: 12.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                child: FadeAnimation(
                  0.6,
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 40.r,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Dsignes',
                        color: Colors.black,
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: 'Découvre',
                          style: _headingStyle,
                        ),
                        TextSpan(
                          text: ' les rares \nCollections ',
                        ),
                        TextSpan(
                          text: 'des ',
                          style: _headingStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                intervalEnd: 0.6,
                begin: const Offset(0, 30),
                child: FadeAnimation(
                  0.6,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        'fav numéro Moov & ',
                        style: TextStyle(
                          fontSize: 30.r,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Dsignes',
                          color: Colors.black,
                          height: 1.3,
                        ),
                      ),
                      AutoSizeText('NFTs',
                          style: TextStyle(
                              fontSize: 25.r, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: FadeAnimation(
                1,
                AutoSizeText(
                  'Le marché digital pour l\'achat de jolie numéro Moov sous forme d\'actif numérique',
                  style: bodyTextStyle,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              height: 200.h,
              padding: EdgeInsets.only(left: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SlideAnimation(
                    intervalStart: 0.4,
                    begin: const Offset(0, 20),
                    child: FadeAnimation(
                      0.4,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          EventStat(
                            title: '45K+',
                            subtitle: 'Enchère',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  SlideAnimation(
                    intervalStart: 0.2,
                    child: FadeAnimation(
                      0.2,
                      Container(
                        padding: EdgeInsets.all(24.r),
                        decoration: const BoxDecoration(
                          color: Color(0xffe6d9fe),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    child: HomeNftScreen(),
                                    type: PageTransitionType.fadeIn,
                                  ),
                                );
                              },
                              child: Container(
                                width: 40.r,
                                height: 40.r,
                                decoration: const BoxDecoration(
                                  color: Color(0xffcab2ff),
                                ),
                                child: const Icon(Iconsax.arrow_right_1),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            AutoSizeText(
                              'Découvrez \nMoov shop',
                              style: TextStyle(
                                fontSize: 20.r,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 9,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Divider(
                              thickness: 2,
                              endIndent: 120.w,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            /* Padding(
              padding: EdgeInsets.symmetric(horizontal: _padding),
              child: SlideAnimation(
                begin: const Offset(0, 20),
                intervalStart: 0.6,
                child: FadeAnimation(
                   0.6,
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Supported By',
                        style: bodyTextStyle,
                      ),
                      SvgPicture.asset(
                        'assets/images/binance.svg',
                        width: 24.r,
                      ),
                      SvgPicture.asset(
                        'assets/images/huobi.svg',
                        width: 22.r,
                      ),
                      SvgPicture.asset(
                        'assets/images/xrp.svg',
                        width: 22.r,
                      ),
                    ],
                  ),
                ),
              ),
            ), */
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppLogo(
          isLogo: true,
          onTap: () {},
        ),
        Container(
          width: 40.r,
          height: 40.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: const Center(
            child: Icon(
              Iconsax.wallet_1,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
