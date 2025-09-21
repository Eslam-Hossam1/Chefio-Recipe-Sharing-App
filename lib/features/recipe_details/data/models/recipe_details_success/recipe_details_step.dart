class RecipeDetailsStep {
  String step;
  String? stepImage;
  String? id;

  RecipeDetailsStep({required this.step, this.stepImage, required this.id});

  factory RecipeDetailsStep.fromJson(Map<String, dynamic> json) =>
      RecipeDetailsStep(
        step: json['step'] as String,
        stepImage: json['stepImage'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'step': step,
        'stepImage': stepImage,
        '_id': id,
      };
}
