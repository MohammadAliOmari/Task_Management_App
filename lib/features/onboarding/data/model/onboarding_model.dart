class OnBoardingModel {
  final String description;
  final String image;
  OnBoardingModel({
    required this.description,
    required this.image,
  });
}

List<OnBoardingModel> onBoardingPage = [
  OnBoardingModel(
    description: 'Let\'s create a\nspace for your\nworkflows.',
    image: 'assets/images/onboarding_1.png',
  ),
  OnBoardingModel(
    description: 'Work more\nStructured and\nOrganized 👌',
    image: 'assets/images/onboarding_2.png',
  ),
  OnBoardingModel(
    description: 'Manage your\nTasks quickly for\nResults✌',
    image: 'assets/images/onboarding_3.png',
  ),
];
