import 'package:flutter/material.dart';

import '../../app/constants/app_text_style.dart';
import '../../app/widgets/widgets.dart';

class MenuCard extends StatelessWidget {
  final int rate;
  final VoidCallback onTap;
  const MenuCard({
    Key? key,
    required this.rate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - (30 + 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 9,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(.1)),
            ]),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 155,
                  margin: const EdgeInsets.only(bottom: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Food name',
                        style: AppTextStyle.caption
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          AppText(
                            rate.toString(),
                            style: AppTextStyle.caption,
                          ),
                          Expanded(
                            child: Text.rich(
                              const TextSpan(
                                text: 'Rp ',
                                children: [
                                  TextSpan(
                                    text: '100.000',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              style: AppTextStyle.caption
                                  .copyWith(color: Colors.grey.shade600),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 35,
              right: 10,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                          color: Colors.black.withOpacity(.1))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
