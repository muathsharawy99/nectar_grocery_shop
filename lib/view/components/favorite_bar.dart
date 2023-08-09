import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteBar extends StatelessWidget {
  const FavoriteBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 10.w,
        end: 10.w,
      ),
      child: Column(
        children: [
          ListTile(

            contentPadding: EdgeInsets.zero,
            leading: Image.asset(
              "assets/ginger.png",
            ),
            title: Text(
              "Ginger",
              style: GoogleFonts.poppins(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "250gm",
              style: GoogleFonts.poppins(),
            ),
            trailing: SizedBox(
              width: 91.w,
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    "\$2.99",
                    style: GoogleFonts.poppins(),
                  ),
                  const Icon(
                    FontAwesomeIcons.angleRight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
