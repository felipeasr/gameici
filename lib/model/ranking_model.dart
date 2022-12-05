class CarRanking {
  late final String email;
  late final int pontos;

  CarRanking({
    required this.email,
    required this.pontos,
  });
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'pontuacao': pontos,
    };
  }
}
