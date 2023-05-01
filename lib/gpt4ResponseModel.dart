// class Gpt4Response {
//   Guidance guidance;

//   Gpt4Response({
//     required this.guidance,
//   });

//   factory Gpt4Response.fromJson(Map<String, dynamic> json) {
//     print("GUIDANCE  === $json");
//     return Gpt4Response(
//       guidance: Guidance.fromJson(json["Guidance"]),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "Guidance": guidance.toJson(),
//       };
// }

class Gpt4Response {
  List<String> steps;
  String meaning;
  String scope;
  String package;
  String functions;
  String qualities;

  Gpt4Response({
    required this.steps,
    required this.meaning,
    required this.scope,
    required this.package,
    required this.functions,
    required this.qualities,
  });

  factory Gpt4Response.fromJson(Map<String, dynamic> json) {
    print("===============  $json");
    return Gpt4Response(
      steps: List<String>.from(json["Steps"].map((x) => x ?? "")),
      meaning: json["Meaning"] ?? "",
      scope: json["Scope"] ?? "",
      package: json["Package"] ?? "",
      functions: json["Functions"] ?? "",
      qualities: json["Qualities"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "Steps": List<dynamic>.from(steps.map((x) => x)),
        "Meaning": meaning,
        "Scope": scope,
        "Package": package,
        "Functions": functions,
        "Qualities": qualities,
      };
}
