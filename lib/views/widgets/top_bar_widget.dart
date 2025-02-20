import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: PreferredSize(
          preferredSize: Size.fromHeight(55.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.red,
                        size: 32.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Chennai",
                                    style: TextStyle(
                                        fontFamily: "custom_font_regular",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: Color(0xff1c1c1c))),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                ))
                              ],
                            )),
                            Text(
                              "Gent's Hostel 4, SSN College of Eng...",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  splashColor: Color(0xffe6e9ef),
                  child: Container(
                    height: 30.h,
                    width: 50.w,
                    padding: EdgeInsets.symmetric(vertical: 5.h)
                        .copyWith(right: 2.w, left: 1.w),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffb8b9bf), width: 1.w)),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Image.asset(
                      "icons/join_gold_logo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                CircleAvatar(
                  radius: 19.r,
                  foregroundColor: const Color.fromARGB(255, 23, 89, 204),
                  backgroundColor: const Color.fromARGB(255, 178, 201, 236),
                  child: Text("A"),
                )
              ],
            ),
          )),
    );
  }
}
