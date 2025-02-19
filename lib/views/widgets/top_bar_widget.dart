import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.red,
                        size: 32,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Chennai",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
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
                                  fontSize: 13,
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
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  splashColor: Color(0xffe6e9ef),
                  child: Container(
                    height: 30,
                    width: 50,
                    padding: EdgeInsets.symmetric(vertical: 5)
                        .copyWith(right: 2, left: 1),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.fromBorderSide(
                            BorderSide(color: Color(0xffb8b9bf), width: 1)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Image.asset(
                      "icons/join_gold_logo.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 19,
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
