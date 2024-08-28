import 'package:cred_app/provider/category_provider.dart';
import 'package:cred_app/screens/home_page.dart';
import 'package:cred_app/widgets/gridview_widget.dart';
import 'package:cred_app/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleViewPage extends StatefulWidget {
  @override
  _ToggleViewPageState createState() => _ToggleViewPageState();
}

class _ToggleViewPageState extends State<ToggleViewPage> {
  bool isGridView = false;
  bool isHeadingVisible = true;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('explore',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.grey)),
                            Text('CRED',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ToggleButtons(
                                constraints: BoxConstraints(
                                  minHeight: 20.0,
                                  minWidth: 20.0,
                                ),
                                borderColor: Colors.white,
                                fillColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                borderWidth: 2,
                                selectedBorderColor: Colors.white,
                                selectedColor: Colors.white,
                                borderRadius: BorderRadius.zero,
                                children: [
                                  Icon(
                                    Icons.grid_view_sharp,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  Icon(
                                    Icons.menu,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ],
                                isSelected: [!isGridView, isGridView],
                                onPressed: (int index) {
                                  setState(() {
                                    isGridView = index == 1;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            ToggleButtons(
                              constraints: BoxConstraints(
                                minHeight: 20.0,
                                minWidth: 20.0,
                              ),
                              borderColor: Colors.white,
                              fillColor: Color.fromARGB(255, 0, 0, 0),
                              borderWidth: 2,
                              selectedBorderColor: Colors.white,
                              selectedColor: Colors.white,
                              borderRadius: BorderRadius.zero,
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                              isSelected: [false],
                              onPressed: (int index) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CredMintPage()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: isHeadingVisible
              ? AnimatedSwitcher(
                  duration: Duration(milliseconds: 600),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final scaleAnimation = Tween<double>(
                      begin: isGridView ? 1.0 : 0.8,
                      end: 1.0,
                    ).animate(animation);

                    final slideAnimation = Tween<Offset>(
                      begin: isGridView ? Offset(1, 0) : Offset(-1, 0),
                      end: Offset.zero,
                    ).animate(animation);

                    return SlideTransition(
                      position: slideAnimation,
                      child: ScaleTransition(
                        scale: scaleAnimation,
                        child: FadeTransition(opacity: animation, child: child),
                      ),
                    );
                  },
                  child: isGridView
                      ? GridviewWidget(
                          key: ValueKey('grid'),
                          categories: categoryProvider.categories,
                          isGridView: isGridView,
                        )
                      : ListviewWidget(
                          key: ValueKey('list'),
                          categories: categoryProvider.categories,
                          isGridView: isGridView,
                        ),
                )
              : Center(
                  child: Text(
                    "Sections Hidden",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
        ),
      ),
    );
  }
}
