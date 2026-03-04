import 'package:get/get.dart';

// class CurrentMoodController extends  GetxController {
//   // Observable selected mood index (-1 means none selected)
//   final RxInt selectedMoodIndex = (-1).obs;
//
//   // Mood options data
//
//   final List<Map<String, dynamic>> moods = [
//     {
//       'label': 'Happy',
//       'image': 'assets/image/arrow/happy.png',
//     },
//     {
//       'label': 'Sad',
//       'image': 'assets/image/arrow/sad.png',
//     },
//     {
//       'label': 'Angry',
//       'image': 'assets/image/arrow/angry.png',
//     },
//     {
//       'label': 'Calm',
//       'image': 'assets/image/arrow/sentiment.png',
//     },
//   ];
//   // Progress value (0.0 – 1.0)
//   final double progress = 0.25;
//
//   void selectMood(int index) {
//     selectedMoodIndex.value = index;
//   }
//
//
//   final double progress2 = 0.25*2;
//
//   void selectMood2(int index) {
//     selectedMoodIndex.value = index;
//   }
//
//
//   final double progress3 = 0.25*3;
//
//   void selectMood3(int index) {
//     selectedMoodIndex.value = index;
//   }
//
//   final double progress4 = 0.25*4;
//
//   void selectMood4(int index) {
//     selectedMoodIndex.value = index;
//   }
//
//
//
//
//   bool isMoodSelected(int index) => selectedMoodIndex.value == index;
//
//   void onNextPressed() {
//     if (selectedMoodIndex.value == -1) {
//       Get.snackbar(
//         'Select a Mood',
//         'Please select how you are feeling today.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//     // Navigate to next screen
//     // Get.toNamed(Routes.NEXT_SCREEN, arguments: moods[selectedMoodIndex.value]);
//   }
//
//   void onBackPressed() {
//     Get.back();
//   }
//   // Multi-select support (as subtitle says "one or more")
//
//
//   final RxInt selectedIndex = 0.obs;
//
//   final List<String> items = [
//     "Journaling",
//     "Meditation",
//     "Fitness",
//     "Anxiety",
//     "Better Sleep",
//   ];
//
//   void selectItem(int index) => selectedIndex.value = index;
//
//
//
//
//   final List<int> hours = List.generate(24, (i) => i); // 0..23
//   final RxInt selectedHour = 0.obs;
//
//   void onHourChanged(int index) {
//     selectedHour.value = hours[index];
//   }
//
//   @override
//   void onClose() {
//     scrollController.dispose();
//     super.onClose();
//   }
//   final List<int> hours = List.generate(24, (i) => i); // 0..23
//   final RxInt selectedHour = 0.obs;
//
//   void onHourChanged(int index) {
//     selectedHour.value = hours[index];
//   }
//
//   @override
//   void onClose() {
//     scrollController.dispose();
//     super.onClose();
//   }
//
//
// }




import 'package:flutter/material.dart';


class CurrentMoodController extends GetxController {
  /// Step/progress (1..4)
 // final RxInt step = 1.obs; // page step
  //double get progress => step.value / 4; // 0.25, 0.50, 0.75, 1.0

 final double progress = 0.25;

  void selectMood(int index) {
    selectedMoodIndex.value = index;
  }


 final double progress2 = 0.50;

 void selectMood2(int index) {
   selectedMoodIndex.value = index;
 }


 final double progress3 = 0.75;

 void selectMood3(int index) {
   selectedMoodIndex.value = index;
 }




 final double progress4 = 1;

 void selectMood4(int index) {
   selectedMoodIndex.value = index;
 }


 /// Mood selection
  final RxInt selectedMoodIndex = (-1).obs;

  final List<Map<String, dynamic>> moods = [
    {'label': 'Happy', 'image': 'assets/image/arrow/happy.png'},
    {'label': 'Sad', 'image': 'assets/image/arrow/sad.png'},
    {'label': 'Angry', 'image': 'assets/image/arrow/angry.png'},
    {'label': 'Calm', 'image': 'assets/image/arrow/sentiment.png'},
  ];

 // void selectMood(int index) => selectedMoodIndex.value = index;
  bool isMoodSelected(int index) => selectedMoodIndex.value == index;

  void onNextPressed() {
    if (selectedMoodIndex.value == -1) {
      Get.snackbar(
        'Select a Mood',
        'Please select how you are feeling today.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    // step move (max 4)
   // if (step.value < 4) step.value++;
  }

  // void onBackPressed() {
  //   if (step.value > 1) {
  //     step.value--;
  //   } else {
  //     Get.back();
  //   }
  // }

  /// Goal selection (single select)
  final RxInt selectedIndex = 0.obs;

  final List<String> items = [
    "Journaling",
    "Meditation",
    "Fitness",
    "Anxiety",
    "Better Sleep",
  ];

  void selectItem(int index) => selectedIndex.value = index;

  /// Hour picker (ListWheel)
  final FixedExtentScrollController scrollController =
  FixedExtentScrollController(initialItem: 0);

  final List<int> hours = List.generate(24, (i) => i);
  final RxInt selectedHour = 0.obs;

  void onHourChanged(int index) => selectedHour.value = hours[index];

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }





}