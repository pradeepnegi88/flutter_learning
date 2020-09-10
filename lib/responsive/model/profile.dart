class Profile {
  String name;
  String country;
  String city;
  String imagePath;
  int followers, posts, following;

  Profile(
      {this.name,
      this.country,
      this.city,
      this.imagePath,
      this.followers,
      this.posts,
      this.following});
}

final List<Profile> profiles = [
  Profile(
      imagePath: "images/lake.jpg",
      name: "Lori prez",
      country: "France",
      city: "Nantes",
      followers: 869,
      posts: 135,
      following: 485),
  Profile(
      imagePath: "images/scene.jpg",
      name: "Lori prez",
      country: "France",
      city: "Nantes",
      followers: 200,
      posts: 234,
      following: 12312),
  Profile(
      imagePath: "images/scene1.jpg",
      name: "Lori prez",
      country: "France",
      city: "Nantes",
      followers: 556,
      posts: 44,
      following: 55),
  Profile(
      imagePath: "images/scene2.jpg",
      name: "Lori prez",
      country: "France",
      city: "Nantes",
      followers: 445,
      posts: 223,
      following: 43455),
];
