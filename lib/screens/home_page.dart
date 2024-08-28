import 'package:cred_app/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:cred_app/provider/category_provider.dart';
import 'package:provider/provider.dart';
import 'package:cred_app/screens/section_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CredMintPage extends StatefulWidget {
  @override
  State<CredMintPage> createState() => _CredMintPageState();
}

class _CredMintPageState extends State<CredMintPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchCategories();
  }

  fetchCategories() async {
    await Provider.of<CategoryProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageContainer(
                          imageUrl: categoryProvider.selectedCategory.icon,
                          width: 80,
                          height: 80),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'CRED' + " " + categoryProvider.selectedCategory.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'grow your savings.',
              style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '3x faster',
              style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: const Color.fromARGB(174, 174, 174, 174)
                        .withOpacity(0.3),
                    width: 8.0,
                  ),
                  right: BorderSide(
                    color: const Color.fromARGB(255, 101, 100, 100)
                        .withOpacity(0.3),
                    width: 8.0,
                  ),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(240, 255, 255, 255),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  shadowColor: const Color.fromARGB(0, 159, 156, 156),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ToggleViewPage()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Go to category',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
