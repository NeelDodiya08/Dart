import 'dart:async';

class BankAccount {
  double balance;

  BankAccount(this.balance);

  Future<void> checkBalance() async {
    await Future.delayed(Duration(seconds: 1));
    print("Current Balance: Rs. $balance");
  }

  Future<void> deposit(double amount) async {
    await Future.delayed(Duration(seconds: 1));
    balance += amount;
    print("Deposited: Rs. $amount");
    print("Updated Balance: Rs. $balance");
  }

  Future<void> withdraw(double amount) async {
    await Future.delayed(Duration(seconds: 1));

    if (balance >= amount) {
      balance -= amount;
      print("Withdrawn: Rs. $amount");
      print("Updated Balance: Rs. $balance");
    } else {
      print("Insufficient Balance!");
    }
  }
}

Future<void> runBankSystem() async {
  BankAccount account = BankAccount(5000);

  print("----- Bank Transaction System -----");

  await account.checkBalance();
  await account.deposit(2000);
  await account.withdraw(1500);
  await account.checkBalance();

  print("Transaction completed successfully.");
}