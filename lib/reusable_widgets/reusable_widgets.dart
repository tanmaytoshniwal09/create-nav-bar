import 'package:flutter/material.dart';

Image logoWidget(String imageName, double imgWidth, double imgHeight,
    {Color? customColor}) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: imgWidth,
    height: imgHeight,
    color: customColor,
  );
}

TextField reusableTextfiled(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(
            color: Color.fromARGB(255, 243, 245, 248).withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(isLogin ? 'LOG IN' : "SIGN UP",
          style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

Widget drawerListTile(String title, String imagePath) {
  return ListTile(
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
    leading: Image.asset(
      imagePath,
      color: Colors.white,
      height: 24,
      width: 24,
    ),
    onTap: () {
      print("Clicked");
    },
  );
}

BottomNavigationBarItem bottomNavigationBarTitle(
    String imagePath, String title) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      imagePath,
      width: 24,
      height: 24,
      color: Colors.white,
    ),
    label: title,
  );
}

Widget appBarIconButton(String imagePath) {
  return IconButton(
    hoverColor: Color.fromARGB(232, 243, 241, 241),
    mouseCursor: MaterialStateMouseCursor.clickable,
    onPressed: () {},
    icon: Image.asset(
      imagePath,
      width: 20,
      height: 20,
      color: Colors.white,
    ),
  );
}

Widget circularContainer(BuildContext context, String imagePath,
    double widthContainer, double heightContainer) {
  return InkWell(
    onTap: () {
      print('Button pressed!');
    },
    child: Container(
      width: widthContainer,
      height: heightContainer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 10, 10, 10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 55, 55, 55).withOpacity(1.0),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: 30.0,
          width: 22.0,
        ),
      ),
    ),
  );
}

Widget profileContainer(double screenWidth, double screenHeight) {
  return Container(
    color: Colors.black,
    child: Padding(
      padding: EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
      ),
      child: SizedBox(
        height: screenHeight / 1.6,
        width: screenWidth,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/profile2.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 55, 55, 55).withOpacity(1.0),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Text(
                          'Tanmay, 21 ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        Image.asset(
                          'assets/check.png',
                          height: 24,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/magistrate.png',
                          height: 18,
                          width: 22,
                          color: Colors.white,
                        ),
                        Text(
                          ' Uit Rgpv Bhopal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/pin.png',
                          height: 18,
                          width: 22,
                          color: Colors.white,
                        ),
                        Text(
                          ' Bhopal, Madhya Pradesh',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
