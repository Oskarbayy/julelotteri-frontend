import 'package:flutter/material.dart';
import 'package:julelotteri_frontend/controller/lotteri_controller.dart';
import 'package:julelotteri_frontend/generated/julelotteri.pb.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 50,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          onPressed: () async {
            final Player? response =
                await LotteriController.instance.onPlayPressed();
            if (response != null) {
              // Display the winning number ball in a dialog.
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Center(
                      child: Container(
                        width: 200, // Adjust the size as needed
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            center: Alignment(-0.3, -0.3),
                            radius: 0.8,
                            colors: [
                              Color(0xFFFF3B3B), // bright red
                              Color(0xFFB22222), // darker red
                            ],
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(
                                16.0), // Adjust padding as needed
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  response.number.toString(),
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  response.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
          onPressed: () async {
            LotteriController.instance.initFilePicker();
          },
        ),
      ],
    );
  }
}
