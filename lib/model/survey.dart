class Survey {
  String id;
  WelcomeScreen welcomeScreen;
  List<Fields> fields;

  Survey({this.id, this.welcomeScreen, this.fields});

  Survey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    welcomeScreen = json['welcome_screen'] != null
        ? new WelcomeScreen.fromJson(json['welcome_screen'])
        : null;
    if (json['fields'] != null) {
      fields = [];
      json['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.welcomeScreen != null) {
      data['welcome_screen'] = this.welcomeScreen.toJson();
    }
    if (this.fields != null) {
      data['fields'] = this.fields.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WelcomeScreen {
  String title;
  Properties properties;
  Attachment attachment;

  WelcomeScreen({this.title, this.properties, this.attachment});

  WelcomeScreen.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    if (this.attachment != null) {
      data['attachment'] = this.attachment.toJson();
    }
    return data;
  }
}

class Fields {
  String id;
  String title;
  Properties properties;
  Validations validations;
  String type;

  Fields({this.id, this.title, this.properties, this.validations, this.type});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    validations = json['validations'] != null
        ? new Validations.fromJson(json['validations'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    if (this.validations != null) {
      data['validations'] = this.validations.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Properties {
  bool showButton;
  String buttonText;
  String description;
  bool allowMultipleSelection;
  bool allowOtherChoice;
  List<Choices> choices;
  bool startAtOne;
  int steps;

  Properties(
      {this.showButton,
      this.buttonText,
      this.description,
      this.allowMultipleSelection,
      this.allowOtherChoice,
      this.choices,
      this.startAtOne,
      this.steps});

  Properties.fromJson(Map<String, dynamic> json) {
    showButton = json['show_button'];
    buttonText = json['button_text'];
    description = json['description'];
    allowMultipleSelection = json['allow_multiple_selection'];
    allowOtherChoice = json['allow_other_choice'];
    if (json['choices'] != null) {
      choices = [];
      json['choices'].forEach((v) {
        choices.add(new Choices.fromJson(v));
      });
    }
    startAtOne = json['start_at_one'];
    steps = json['steps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show_button'] = this.showButton;
    data['button_text'] = this.buttonText;
    data['description'] = this.description;
    data['allow_multiple_selection'] = this.allowMultipleSelection;
    data['allow_other_choice'] = this.allowOtherChoice;
    if (this.choices != null) {
      data['choices'] = this.choices.map((v) => v.toJson()).toList();
    }
    data['start_at_one'] = this.startAtOne;
    data['steps'] = this.steps;
    return data;
  }
}

class Choices {
  String id;
  String label;
  Attachment attachment;

  Choices({this.id, this.label, this.attachment});

  Choices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    attachment = json['attachment'] != null
        ? new Attachment.fromJson(json['attachment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    if (this.attachment != null) {
      data['attachment'] = this.attachment.toJson();
    }
    return data;
  }
}

class Attachment {
  String type;
  String link;
  Properties properties;
  String href;

  Attachment({this.type, this.link, this.properties, this.href});

  Attachment.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    link = json['link'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    data['href'] = this.href;
    return data;
  }
}

class Validations {
  bool required;
  int limi;

  Validations({this.required, this.limi});

  Validations.fromJson(Map<String, dynamic> json) {
    required = json['required'];
    limi = json['limi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required'] = this.required;
    data['limi'] = this.limi;
    return data;
  }
}
