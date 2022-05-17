import 'package:flutter/material.dart';
import 'package:padc_animations/implicit_animations/explicit_animation_favourite_button.dart';

const kAnimationDuration = const Duration(milliseconds: 500);
const kAnimationDurationForScreenFadeIn = const Duration(milliseconds: 1000);

class ImplicitAnimations extends StatefulWidget {
  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isDescriptionShown = true;
  bool isChangeBackgroundColor = false;
  bool isChangeButtonsLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: kAnimationDurationForScreenFadeIn,
            builder: (context, double _opacity, child) => Opacity(
              opacity: _opacity,
              child: child,
            ),
            tween: Tween<double>(begin: 0, end: 1),
            child: AnimatedContainer(
              duration: kAnimationDuration,
              color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          width: (isNewDimensions) ? 350 : 250,
                          height: (isNewDimensions) ? 300 : 200,
                          // curve: Curves.easeInCubic,
                          duration: kAnimationDuration,
                          child: Image.asset(
                            "assets/bird_image.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: ExplicitAnimationFavouriteIcon(),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: Container(
                        height: isDescriptionShown ? null : 0.0,
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: isChangeBackgroundColor
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: AnimatedSwitcher(
                        duration: kAnimationDuration,
                        child: (isChangeButtonsLayout)
                            ? PrimaryButtonInWrap(
                                onTapChangeDimension: () {
                                  setState(() {
                                    isNewDimensions = !isNewDimensions;
                                  });
                                },
                                onTapHideOrShowDescription: () {
                                  setState(() {
                                    isDescriptionShown = !isDescriptionShown;
                                  });
                                },
                                onTapChangeTheme: () {
                                  setState(() {
                                    isChangeBackgroundColor =
                                        !isChangeBackgroundColor;
                                  });
                                },
                                isDescriptionShown: isDescriptionShown,
                              )
                            : PrimaryButtonInColumn(
                                onTapChangeDimension: () {
                                  setState(() {
                                    isNewDimensions = !isNewDimensions;
                                  });
                                },
                                onTapHideOrShowDescription: () {
                                  setState(() {
                                    isDescriptionShown = !isDescriptionShown;
                                  });
                                },
                                onTapChangeTheme: () {
                                  setState(() {
                                    isChangeBackgroundColor =
                                        !isChangeBackgroundColor;
                                  });
                                },
                                isDescriptionShown: isDescriptionShown,
                              ),
                      ),
                    ),
                    SizedBox(height: 16),
                    PrimaryButton(
                      onTap: () {
                        setState(() {
                          isChangeButtonsLayout = !isChangeButtonsLayout;
                        });
                      },
                      label: "Change Button Layout",
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
          TweenAnimationBuilder(
            child: Text(
              "PADC Animations",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (isChangeBackgroundColor) ? Colors.white : Colors.black,
                fontSize: 24,
              ),
            ),
            duration: kAnimationDurationForScreenFadeIn,
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double _value, child) => Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(
                  top: _value * 64,
                  left: 16,
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButtonInWrap extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapHideOrShowDescription;
  final Function onTapChangeTheme;
  final bool isDescriptionShown;

  PrimaryButtonInWrap({
    required this.onTapChangeDimension,
    required this.onTapHideOrShowDescription,
    required this.onTapChangeTheme,
    required this.isDescriptionShown,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16.0,
      children: [
        PrimaryButton(
          onTap: onTapChangeDimension,
          label: "Change Dimension",
        ),
        PrimaryButton(
          onTap: onTapHideOrShowDescription,
          label: isDescriptionShown ? "Hide Description" : "Show Description",
        ),
        PrimaryButton(
          onTap: onTapChangeTheme,
          label: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButtonInColumn extends StatelessWidget {
  final Function onTapChangeDimension;
  final Function onTapHideOrShowDescription;
  final Function onTapChangeTheme;
  final bool isDescriptionShown;

  PrimaryButtonInColumn({
    required this.onTapChangeDimension,
    required this.onTapHideOrShowDescription,
    required this.onTapChangeTheme,
    required this.isDescriptionShown,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          onTap: onTapChangeDimension,
          label: "Change Dimension",
        ),
        PrimaryButton(
          onTap: onTapHideOrShowDescription,
          label: isDescriptionShown ? "Hide Description" : "Show Description",
        ),
        PrimaryButton(
          onTap: onTapChangeTheme,
          label: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final Color color;

  PrimaryButton(
      {required this.onTap, required this.label, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onTap();
      },
      textColor: Colors.white,
      color: color,
      child: Text(label),
    );
  }
}
