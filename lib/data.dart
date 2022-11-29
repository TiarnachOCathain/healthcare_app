class HealthImage {
  String url;
  String title;

  HealthImage(this.url, this.title);
}

class HomeIcon {
  String title;
  HealthImage coverImage;

  //List<GameImage> images;
  String description;

  //String studio;

  HomeIcon(this.title, this.coverImage, this.description);
}

List<HomeIcon> healthIcon = [
  HomeIcon(
    "Horizon Zero Dawn",
    HealthImage("images/doctor.jpg", ""),
    "",
  ),
  HomeIcon(
    "Scan for infection",
    HealthImage(
        "https://i.pinimg.com/564x/0b/0e/d9/0b0ed9b43e39d27a7e41beff4fe2e45b.jpg",
        ""),
    "",
  )
];

List<HomeIcon> healthIcon2 = [
  HomeIcon(
    "Grand Theft Auto V",
    HealthImage(
        "https://gpstatic.com/acache/26/25/1/uk/packshot-7136bdab871d6b2c8f07ccc9ad33b4d0.jpg",
        ""),
    "",
    //"Rockstar Games",
  ),
  HomeIcon(
    "The Last of Us Part II",
    HealthImage("https://mvpo.us/img/P6253.jpg", ""),
    "",
    //"Naughty Dog",
  )
];

List<HomeIcon> featuredIcons = [
  HomeIcon(
    "Welcome to Healthcare App.",
    HealthImage(
        "https://i.pinimg.com/564x/93/6b/af/936bafff90d24a5843f16a75cc5c92c7.jpg",
        "Click or scroll for more info"),
    "",
    //"Feral Interactive",
  ),
  HomeIcon(
    "",
    HealthImage("", "Scan and help medical practitioners take care of you"),
    "",
    //"Infinity Ward",
  )
];
