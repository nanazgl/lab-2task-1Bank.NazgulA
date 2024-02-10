//
//  main.swift
//  lab#2task#1Bank
//
//  Created by Nazgul Atykhan
//

import Foundation

class BankAccount {
    let accountNumber: String
    let accountOwner: String
    var balance: Double
    
    init(accountNumber: String, accountOwner: String, balance: Double) {
        self.accountNumber = accountNumber
        self.accountOwner = accountOwner
        self.balance = balance
    }
    
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("Deposit amount must be greater than zero.")
            return
        }
        balance += amount
        print("Deposit of \(amount) successful. New balance: \(balance)")
    }
    
    func withdraw(amount: Double) {
        guard amount > 0 else {
            print("Withdrawal amount must be greater than zero.")
            return
        }
        guard balance >= amount else {
            print("Insufficient funds.")
            return
        }
        balance -= amount
        print("Withdrawal of \(amount) successful. New balance: \(balance)")
    }
    
    func getBalance() -> Double {
        return balance
    }
    
    func displayAccountInfo() {
        print("Account Number: \(accountNumber)")
        print("Account Owner: \(accountOwner)")
        print("Current Balance: \(balance)")
    }
}
func generateAccountNumber() -> String {
    var accountNumber = ""
    for _ in 1...5 {
        accountNumber += "\(Int.random(in: 0...9))"
    }
    return accountNumber
}

print("Enter your name:")
let accountOwner = readLine() ?? ""
print("Enter your initial balance:")
if let initialBalanceString = readLine(), let initialBalance = Double(initialBalanceString) {
    let accountNumber = generateAccountNumber()
    let account = BankAccount(accountNumber: accountNumber, accountOwner: accountOwner, balance: initialBalance)
    account.displayAccountInfo()

    print("Do you want to deposit money? (y/n)")
    if let depositChoice = readLine(), depositChoice.lowercased() == "y" {
        print("Enter amount to deposit:")
        if let depositAmountString = readLine(), let depositAmount = Double(depositAmountString) {
            account.deposit(amount: depositAmount)
        } else {
            print("Invalid deposit amount.")
        }
    } else {
        print("No deposit made.")
    }
    print("Do you want to withdraw money? (y/n)")
    if let withdrawChoice = readLine(), withdrawChoice.lowercased() == "y" {
        print("Enter amount to withdraw:")
        if let withdrawAmountString = readLine(), let withdrawAmount = Double(withdrawAmountString) {
            account.withdraw(amount: withdrawAmount)
        } else {
            print("Invalid withdrawal amount.")
        }
    } else {
        print("No withdrawal made.")
    }
} else {
    print("Invalid initial balance.")
}
