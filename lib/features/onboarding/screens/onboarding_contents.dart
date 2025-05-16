class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Discover Your Interests",
    image: "assets/images/interest.svg",
    desc: "Explore a wide range of topics and articles tailored to your interests. Our AI-powered recommendations help you find the content you love.",
  ),
  OnboardingContents(
    title: "Personalized Experience",
    image: "assets/images/article.svg",
    desc: "Get personalized article suggestions and updates. Our AI learns from your reading habits to provide a unique and engaging experience.",
  ),
  OnboardingContents(
    title: "Engage with AI Features",
    image: "assets/images/ai.svg",
    desc: "Leverage advanced AI tools for content creation, editing, and translation. Enhance your writing and reach a global audience with ease.",
  ),
];
