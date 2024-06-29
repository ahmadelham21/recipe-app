class Instruction {
  final String displayText;

  Instruction({
    required this.displayText,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        displayText: json["display_text"] != null ? json['display_text'] : '',
      );

}

class Section {
  Section({
    required this.components,
  });

  List<Component> components;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    components: json["components"] != null ? List<Component>.from(json["components"].map((x) => Component.fromJson(x))) : [],
  );
}

class Component {
  Component({
     required this.rawText,
  });
  String rawText;

  factory Component.fromJson(Map<String, dynamic> json) => Component(
    rawText: json["raw_text"] != null ? json["raw_text"] : '',
  );

}

class Resep {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instruction> instructions;
  final List<Section> sections;

  Resep(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime,
      required this.description,
      required this.videoUrl,
      required this.instructions,
      required this.sections
      });

  factory Resep.fromJson(dynamic json) {
    return Resep(
        name: json['name'] as String,
        images: json['thumbnail_url'] as String,
        rating: json['country'] as String,
        totalTime: json['total_time_minutes'] != null
            ? json['total_time_minutes'].toString() + " Minutes"
            : "30 Minutes",
        description: json['description'] != null
            ? json['description']
            : "Description Not Found",
        videoUrl: json['original_video_url'] != null
            ? json['original_video_url']
            : 'Video Not Found',
        instructions: json['instructions'] != null
            ? List<Instruction>.from(
                json["instructions"].map((x) => Instruction.fromJson(x)))
            : [],
        sections: json["sections"] != null 
            ? List<Section>.from(
              json["sections"].map((x) => Section.fromJson(x))) 
            : []
            
    );
  }

  static List<Resep> resepFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Resep.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Resep {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
