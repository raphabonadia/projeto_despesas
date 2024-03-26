class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  // Construtor para converter de JSON para objeto
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      value: json['value'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  // Método para converter de objeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'date': date.toIso8601String(),
    };
  }
}
