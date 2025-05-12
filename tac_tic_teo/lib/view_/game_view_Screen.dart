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
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              pinned: true,
              floating: true,
              expandedHeight: 150.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
              ),

              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.r),
                      bottomRight: Radius.circular(25.r),
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
                                  color: Colors.white,
                                  fontSize: 20.sp,
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
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () => pro.makeMove(index),
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Text(
                                pro.board[index],
                                style: const TextStyle(fontSize: 36, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      pro.gameOver
                          ? pro.result
                          : 'Current Player: ${pro.currentPlayer == Player.X ? 'X' : 'O'}',
                      style: GoogleFonts.agbalumo(color: Colors.black, fontSize: 20.sp),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: pro.resetGame,
                    child: Text('Reset', style: GoogleFonts.aBeeZee(color: Colors.black),),
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
