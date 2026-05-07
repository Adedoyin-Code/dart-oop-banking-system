// =============== This project consist of  the 4 fundermentals of OOP  "Encapsulation - Inheritance - Polymorphism - Abstraction"===============

// Build a complete fintech banking system
//
// Create an abstract class called Account with:
// _ownerName (private), _balance (private)
// getter for ownerName and balance
// setter for balance — block if negative
// and 2 abstract methods:
// void processTransaction(int amount)
// String getAccountSummary()
//
// Create 3 child classes —
//
// SavingsAccount extends Account with: interestRate
//    processTransaction(int amount) — adds amount to balance
//       prints "{ownerName} saved {amount}. New balance: {balance}"
//    getAccountSummary() — returns
//       "Savings Account | Owner: {ownerName} | Balance: {balance} | Interest: {interestRate}%"
//
// CurrentAccount extends Account with: overdraftLimit
//    processTransaction(int amount) — subtracts amount from balance
//       if amount exceeds balance print "Insufficient funds"
//       otherwise subtract and print "{ownerName} withdrew {amount}. New balance: {balance}"
//    getAccountSummary() — returns
//       "Current Account | Owner: {ownerName} | Balance: {balance} | Overdraft Limit: {overdraftLimit}"
//
// LoanAccount extends Account with: loanAmount, interestRate
//    processTransaction(int amount) — subtracts amount from loanAmount
//       prints "{ownerName} paid {amount} towards loan. Remaining loan: {loanAmount}"
//    getAccountSummary() — returns
//       "Loan Account | Owner: {ownerName} | Loan: {loanAmount} | Interest: {interestRate}%"
//
// Then in main —
// Create 1 object from each child class
// Test the balance setter with a negative value on savings account
// Call processTransaction() on each
// Print getAccountSummary() for all 3

abstract class Account {
  String? _ownerName;
  int? _balance;

  Account({String? ownerName, int? balance}) {
    _ownerName = ownerName;
    _balance = balance;
  }

  get ownerName {
    return _ownerName;
  }

  get balance {
    return _balance;
  }

  set balance(int amount) {
    if (amount < 0) {
      print('Blocked');
    } else {
      _balance = amount;
    }
  }

  void processTransaction(int amount);
  String getAccountSummary();
}

class SavingsAccount extends Account {
  int? interestRate;
  SavingsAccount({String? ownerName, int? balance, this.interestRate})
    : super(balance: balance, ownerName: ownerName);

  @override
  void processTransaction(int amount) {
    _balance = _balance! + amount;
    print('$_ownerName saved $amount. New balance: $_balance');
  }

  @override
  String getAccountSummary() {
    return 'Savings Account | Owner: $_ownerName | Balance: $balance | Interest: $interestRate%';
  }
}

class CurrentAccount extends Account {
  int? overdraftLimit;
  CurrentAccount({String? ownerName, int? balance, this.overdraftLimit})
    : super(balance: balance, ownerName: ownerName);

  @override
  void processTransaction(int amount) {
    if (amount > _balance!) {
      print('Insufficient Funds');
    } else {
      _balance = _balance! - amount;
      print('$ownerName withdrew $amount. New balance: $_balance');
    }
  }

  @override
  String getAccountSummary() {
    return 'Current Account | Owner: $_ownerName | Balance: $balance | Overdraft Limit: $overdraftLimit';
  }
}

class LoanAccount extends Account {
  int? loanAmount;
  int? interestRate;

  LoanAccount({
    String? ownerName,
    int? balance,
    this.interestRate,
    this.loanAmount,
  }) : super(balance: balance, ownerName: ownerName);

  @override
  void processTransaction(int amount) {
    loanAmount = loanAmount! - amount;
    print('$ownerName paid $amount towards loan. Remaining loan: $loanAmount');
  }

  @override
  String getAccountSummary() {
    return 'Loan Account | Owner: $ownerName | Loan: $loanAmount | Interest: $interestRate%';
  }
}

void main() {
  SavingsAccount savingsAccount1 = SavingsAccount(
    ownerName: 'Ade',
    balance: 780000,
    interestRate: 30,
  );
  CurrentAccount currentAccount1 = CurrentAccount(
    ownerName: 'Bisi',
    balance: 2000000,
    overdraftLimit: 5,
  );
  LoanAccount loanAccount1 = LoanAccount(
    ownerName: 'Tim',
    balance: 200000,
    loanAmount: 3000000,
    interestRate: 20,
  );

  savingsAccount1.balance = -600;
  savingsAccount1.balance = 9000;

  savingsAccount1.processTransaction(60000);
  currentAccount1.processTransaction(7000);
  loanAccount1.processTransaction(45000);

  print(savingsAccount1.getAccountSummary());
  print(currentAccount1.getAccountSummary());
  print(loanAccount1.getAccountSummary());
}
