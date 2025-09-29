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
  List ContainerColor = [
    Colors.green, Colors.green, Colors.green, Colors.deepOrange, Colors.deepOrange, Colors.deepOrange, Colors.teal, Colors.teal, Colors.teal
  ];
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Gameprovider>(context);
    return Scaffold(
      body: Container(
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
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Tac Tic Teo',
                style: GoogleFonts.adamina(
                  color: Colors.purple,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              pinned: true,
              floating: true,
              expandedHeight: 150.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),

              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                    child: Container(
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

                      child: FlexibleSpaceBar(
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Game',
                                style: GoogleFonts.aDLaMDisplay(
                                  color: Colors.deepOrange,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Tic Tac Toe Board
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 400.w,  
                        maxHeight: 400.w,
                      ),
                      child: AspectRatio(
                        aspectRatio: 1, // keeps board square
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ContainerColor.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => pro.makeMove(index),
                            child: Container(
                              margin: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18.r),
                                color: ContainerColor[index],
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
                  ),

                  const SizedBox(height: 20),

                  /// Game status
                  Center(
                    child: Text(
                      pro.gameOver
                          ? pro.result
                          : 'Current Player: ${pro.currentPlayer == Player.X ? 'X' : 'O'}',
                      style: GoogleFonts.agbalumo(
                        color: Colors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Reset Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shadowColor: Colors.grey,
                      foregroundColor: Colors.amberAccent,
                    ),
                    onPressed: pro.resetGame,
                    child: Text(
                      'Reset',
                      style: GoogleFonts.aBeeZee(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
