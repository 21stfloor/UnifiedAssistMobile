import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthrough_text/walkthrough_text_widget.dart';

// Focus widget keys for this walkthrough
final containerBozpghs7 = GlobalKey();
final columnUkuh2dgb = GlobalKey();
final toggleIcon0a9yaxu8 = GlobalKey();
final columnM9f5g4n6 = GlobalKey();
final containerDm0qc91m = GlobalKey();
final columnRexx1p2x = GlobalKey();
final columnBlrj1rqc = GlobalKey();
final tabXd3w5zvw = GlobalKey();

/// getting started
///
/// Getting started
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// intro
      TargetFocus(
        keyTarget: containerBozpghs7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => const WalkthroughTextWidget(
              title: 'Welcome to Unified Assist',
              description: 'This app will help elders',
            ),
          ),
        ],
      ),

      /// locationGuide
      TargetFocus(
        keyTarget: columnUkuh2dgb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'Location button',
              description: 'This will show your current location in map',
              action: () async {},
            ),
          ),
        ],
      ),

      /// alarm toggle
      TargetFocus(
        keyTarget: toggleIcon0a9yaxu8,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'Alarm Generation',
              description: 'This will enable/disable alarm sos',
              action: () async {},
            ),
          ),
        ],
      ),

      /// sos
      TargetFocus(
        identify: 'doneTab1',
        keyTarget: columnM9f5g4n6,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'Sos',
              description: 'This will show you list of your sos contacts',
              action: () async {},
            ),
          ),
        ],
      ),

      /// text guide
      TargetFocus(
        keyTarget: containerDm0qc91m,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'Text Scan',
              description:
                  'Using your camera, this will read the text seen by the camera',
              action: () async {},
            ),
          ),
        ],
      ),

      /// documents guide
      TargetFocus(
        keyTarget: columnRexx1p2x,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'Document scan',
              description: 'This will read the texts in your document files',
              action: () async {},
            ),
          ),
        ],
      ),

      /// obstacle guide
      TargetFocus(
        keyTarget: columnBlrj1rqc,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'Obstacle scan',
              description:
                  'This will scan obstacle that may block your path in front of you',
              action: () async {},
            ),
          ),
        ],
      ),

      /// first aid guide
      TargetFocus(
        keyTarget: tabXd3w5zvw,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: const Color(0x7E000000),
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkthroughTextWidget(
              title: 'First aid tips',
              description: 'You can read first aid tips in here',
              action: () async {},
            ),
          ),
        ],
      ),
    ];
