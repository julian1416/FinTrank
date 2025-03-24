class Budget {
  double totalBudget;  // Presupuesto total
  double savingsGoal;  // Meta de ahorro

  Budget({required this.totalBudget, required this.savingsGoal});

  Map<String, dynamic> toMap() {
    return {
      'totalBudget': totalBudget,
      'savingsGoal': savingsGoal,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      totalBudget: map['totalBudget'],
      savingsGoal: map['savingsGoal'],
    );
  }
}
