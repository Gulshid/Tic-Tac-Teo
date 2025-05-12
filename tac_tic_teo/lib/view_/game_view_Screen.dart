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
    Colors.orange, Colors.lime, Colors.blue, Colors.deepPurple, Colors.deepOrange, Colors.green, const Color.fromARGB(255, 202, 31, 91), Colors.lightGreenAccent, const Color.fromARGB(255, 33, 176, 78)
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
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: ContainerColor.length,
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
                              borderRadius: BorderRadius.circular(18.r),
                              color: ContainerColor[index],
                            ),
                            child: Center(
                              child: Text(
                                pro.board[index],
                                style:  GoogleFonts.akatab(
                                  fontSize: 40.sp,
                                  color: Colors.white,
                                  fontWeight:FontWeight.bold
                                ),
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
                      style: GoogleFonts.agbalumo(
                        color: Colors.black,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shadowColor:Colors.grey,
                      foregroundColor:Colors.amberAccent
                    ),
                    onPressed: pro.resetGame,
                    child: Text(
                      'Reset',
                      style: GoogleFonts.aBeeZee(color: Colors.white,),
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
