// ignore_for_file: public_member_api_docs, sort_constructors_first
class Exercises {
  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instruction;

  Exercises({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instruction,
  });

  Exercises copyWith({
    String? name,
    String? type,
    String? muscle,
    String? equipment,
    String? difficulty,
    String? instruction,
  }) {
    return Exercises(
      name: name ?? this.name,
      type: type ?? this.type,
      muscle: muscle ?? this.muscle,
      equipment: equipment ?? this.equipment,
      difficulty: difficulty ?? this.difficulty,
      instruction: instruction ?? this.instruction,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'muscle': muscle,
      'equipment': equipment,
      'difficulty': difficulty,
      'instruction': instruction,
    };
  }

  factory Exercises.fromJson(Map<String, dynamic> json) {
    return Exercises(
      name: json['name'] as String?,
      type: json['type'] as String?,
      muscle: json['muscle'] as String?,
      equipment: json['equipment'] as String?,
      difficulty: json['difficulty'] as String?,
      instruction: json['instruction'] as String?,
    );
  }

  @override
  String toString() {
    return 'Exercises(name: $name, type: $type, muscle: $muscle, equipment: $equipment, difficulty: $difficulty, instruction: $instruction)';
  }
}
