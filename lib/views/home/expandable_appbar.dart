
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/appbar_provider.dart';
import '../../utils/responsive.dart';
import 'components/text_animation.dart';

class ExpandableAppBar extends StatelessWidget {
  const ExpandableAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 1, 2, 39),
      body: SingleChildScrollView(
        child: SizedBox(
          height: getHeight(context),
          child: Stack(
            children: [
              Column(
                children: [
                  Consumer<DarggableAppBarProvider>(
                    builder: (context, provider, snapshot) {
                      return Column(
                        children: [
                          Container(
                            width: getWidth(context),
                            height: provider.getHeight,
                            // width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(30),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1607499699372-7bb722dff7e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: provider.getHeight > 150 ? 50 : 10,
                                  left: provider.getHeight > 150 ? 40 : 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: provider.getHeight < 150 ? 0 : 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (provider.getHeight > 150)
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.person,
                                                color: Colors.white,
                                                size: 50,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "HiddenCodz",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              if (provider.getHeight > 180)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: List.generate(
                                                      5,
                                                      (index) => const Icon(
                                                        Icons.star,
                                                        color: Color.fromARGB(
                                                            255, 255, 208, 0),
                                                        size: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        if (provider.getHeight < 150)
                                          const SizedBox(
                                            height: 40,
                                          ),
                                        if (provider.getHeight < 150)
                                          SizedBox(
                                            width: getWidth(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  "Expandable AppBar",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: provider.getHeight > 150
                                          ? const CircleAvatar(
                                              backgroundColor: Colors.white10,
                                              radius: 60,
                                              backgroundImage: AssetImage(
                                                  "assets/hiddencodz.png"),
                                            )
                                          : null,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  //Body of Page
                  Expanded(
                    child: Container(
                      color: Color.fromARGB(255, 1, 2, 39),
                      child: const TextAnimation(),
                    ),
                  ),
                ],
              ),
              Consumer<DarggableAppBarProvider>(
                builder: (context, provider, snapshot) {
                  return GestureDetector(
                    onVerticalDragUpdate: (value) {
                      if (value.delta.dy > 0) {
                        provider.dragDown();
                      }
                      if (value.delta.dy < 0) {
                        provider.dragUp();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: provider.getHeight + 40,
                        ),
                        const Icon(
                          Icons.more_horiz,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
