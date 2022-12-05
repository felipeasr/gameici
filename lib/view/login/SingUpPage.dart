import 'package:flutter/material.dart';
import 'package:gameici/view/login/widgets/singup_widgets.dart';
import '../../controller/ResponsiveScreen.dart';
import '../../controller/SizeConfig.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!Responsive.isDesktop(context))
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [SingUnpWidget()],
                    ),
                  ),
                ),
              ),
//PC
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: ListView(
                  padding: const EdgeInsets.only(
                      top: 50.0, right: 150.0, left: 150.0, bottom: 90),
                  children: const <Widget>[SingUnpWidget()],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
