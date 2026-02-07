
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tac_tic_teo/model_/GameModel.dart';
import 'package:tac_tic_teo/viewModel_/GameProvider.dart';

class GameViewScreen extends StatefulWidget {
  const GameViewScreen({super.key});

  @override
  State<GameViewScreen> createState() => _GameViewScreenState();
}

class _GameViewScreenState extends State<GameViewScreen> {
  List containerColor = [
    Colors.green,
    Colors.green,
    Colors.green,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.deepOrange,
    Colors.teal,
    Colors.teal,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Gameprovider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.tealAccent,
              Colors.teal,
              Colors.lime,
              Colors.greenAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Title
                Text(
                  'Tac Tic Teo',
                  style: GoogleFonts.adamina(
                    color: Colors.purple,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),

                /// Board
                Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: containerColor.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                      itemBuilder:
                          (context, index) => GestureDetector(
                            onTap: () => pro.makeMove(index),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                color: containerColor[index],
                              ),
                              child: Center(
                                child: Text(
                                  pro.board[index],
                                  style: GoogleFonts.akatab(
                                    fontSize: 40.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                /// Game status
                Text(
                  pro.gameOver
                      ? pro.result
                      : 'Current Player: ${pro.currentPlayer == Player.X ? 'X' : 'O'}',
                  style: GoogleFonts.agbalumo(
                    color: Colors.black,
                    fontSize: 20.sp,
                  ),
                ),

                SizedBox(height: 20.h),

                /// Reset Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shadowColor: Colors.grey,
                    foregroundColor: Colors.amberAccent,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                  ),
                  onPressed: pro.resetGame,
                  child: Text(
                    'Reset',
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
