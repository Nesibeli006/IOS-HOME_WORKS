// 📌 Homework 2: Safe ATM Banking Terminal Simulator

// Task Description:
// Write a Dart script simulating an ATM Terminal using functions, named parameters, arrow syntax =>, and Sound Null Safety (?, ??, !).

// 1. Function checkBalance:
// • Type: Arrow function =>
// • Parameters: name (String, required), balance (double, required)
// • Behavior: Prints the user's current available balance

// 2. Function deposit:
// • Parameters: currentBalance (double, required), amount (double?, optional nullable)
// • Behavior:
//   - If amount is null, default it to 0.0 using the ?? operator
//   - Add valid deposit amount to currentBalance
//   - Print receipt message and return updated balance

// 3. Function withdraw:
// • Parameters: name (String, required), currentBalance (double, required), amount (double?, optional nullable), pinCode (int?, optional nullable)
// • Behavior:
//   - Verify PIN code: Default correct PIN is 1234. If pinCode is incorrect or null (use ?? 0000), decline transaction and print error message
//   - Safely unpack amount defaulting to 0.0 if null using ??
//   - Balance check: Ensure amount does not exceed currentBalance. If insufficient funds, print error and decline transaction
//   - Print transaction result and return updated balance
void main() {
  double balance = 1000.0;
  double depositAmount = 500.0;
  checkBalance(name: "Nesibeli", balance: balance);

  balance = deposit(currentBalance: balance, amount: depositAmount);

  balance = withdraw(name: "Nesibeli", currentBalance: balance, amount: 200.0, pinCode: 1111);

  balance = withdraw(name: "Nesibeli", currentBalance: balance, amount: 300.0, pinCode: 1234);
}

void checkBalance({required String name, required double balance}) => print("$name, your current balance is: $balance");

double deposit({required double currentBalance, double? amount}) {
  double depositAmount = amount ?? 0.0;
  double updatedBalance = currentBalance + depositAmount;
  print("Deposit successful! Amount deposited: $depositAmount. Updated balance: $updatedBalance");
  return updatedBalance;
}

double withdraw({required String name, required double currentBalance, double? amount, int? pinCode}) {
  int correctPin = 1234;
  if ((pinCode ?? 0000) != correctPin) {
    print("Error: Incorrect PIN. Transaction declined.");
    return currentBalance;
  }
  double withdrawAmount = amount ?? 0.0;
  if (withdrawAmount > currentBalance) {
    print("Error: Insufficient funds. Transaction declined.");
    return currentBalance;
  }
  double updatedBalance = currentBalance - withdrawAmount;
  print("Withdrawal successful! Amount withdrawn: $withdrawAmount. Updated balance: $updatedBalance");
  return updatedBalance;
}