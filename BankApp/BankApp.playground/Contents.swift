import Foundation

final class BankAcconut {
    
    let numberAccount: String
    private var balance: Double
    
    init(numberAccount: String, balance: Double) {
        self.numberAccount = numberAccount
        self.balance = balance
    }
    
    func addMoney(count: Double) {
        balance += count
    }
    
    func takeMoney(count: Double) -> Bool {
        if count >= balance {
            print("Операция отклонена")
            return false
        } else {
            balance -= count
            print("Успешно")
            print("Баланс: \(balance)")
            return true
        }
    }
    
    func getBalance() -> Double {
        return balance
    }
}

final class Bank {
    var accounts: [String: BankAcconut] = .init()
    
    func addAccount(account: BankAcconut) {
        accounts[account.numberAccount] = account
    }
    
    func addMoney(id: String, amount: Double) {
        guard let account = accounts[id] else {
            print("Пользователя не существует")
            return
        }
        
        account.addMoney(count: amount)
        accounts[id] = account
    }
    
    func withdrawFromAccount(id: String, amount: Double) {
        guard var account = accounts[id] else {
            print("Пользователя не существует")
            return
        }
        
        guard account.takeMoney(count: amount) else {
            return
            
        }
        
        accounts[id] = account
    }
    
    func moneyTransfer(sendAccount: String, recipientAccount: String, amount: Double) {
        guard var send = accounts[sendAccount], var recipient = accounts[recipientAccount] else {
            print("Не найден аккаунт")
            return
        }
        print("\(sendAccount) перевел \(recipientAccount): \(amount)")
        
        guard recipient.takeMoney(count: amount) else {
            print("На вашем аккаунте недостаточно средств")
            return
        }
        
        recipient.addMoney(count: amount)
        accounts[sendAccount] = send
        accounts[recipientAccount] = recipient
    }
}


let bank = Bank()

let account1 = BankAcconut(numberAccount: "001", balance: 1000.0)
let account2 = BankAcconut(numberAccount: "002", balance: 500.0)
let account3 = BankAcconut(numberAccount: "003", balance: 2000.0)

bank.addAccount(account: account1)
bank.addAccount(account: account2)
bank.addAccount(account: account3)

func testDeposit() {
    print("--- Тесты на пополнение счета ---")
    
    bank.addMoney(id: "001", amount: 500.0)
    print("Баланс аккаунта 001 после пополнения: \(bank.accounts["001"]!.getBalance())")

    bank.addMoney(id: "002", amount: 300.0)
    print("Баланс аккаунта 002 после пополнения: \(bank.accounts["002"]!.getBalance())")
    
    bank.addMoney(id: "003", amount: 1000.0)
    print("Баланс аккаунта 003 после пополнения: \(bank.accounts["003"]!.getBalance())")
}

func testWithdraw() {
    print("--- Тесты на списание со счета ---")
    
    bank.withdrawFromAccount(id: "001", amount: 200.0)
    print("Баланс аккаунта 001 после снятия: \(bank.accounts["001"]!.getBalance())")
    
    bank.withdrawFromAccount(id: "002", amount: 600.0)
    print("Баланс аккаунта 002 после снятия: \(bank.accounts["002"]!.getBalance())")
    
    bank.withdrawFromAccount(id: "003", amount: 1500.0)
    print("Баланс аккаунта 003 после снятия: \(bank.accounts["003"]!.getBalance())")
}

func testTransfer() {
    print("--- Тесты на перевод между счетами ---")

    bank.moneyTransfer(sendAccount: "001", recipientAccount: "002", amount: 300.0)
    print("Баланс аккаунта 001 после перевода: \(bank.accounts["001"]!.getBalance())")
    print("Баланс аккаунта 002 после перевода: \(bank.accounts["002"]!.getBalance())")

    bank.moneyTransfer(sendAccount: "002", recipientAccount: "003", amount: 400.0)
    print("Баланс аккаунта 002 после перевода: \(bank.accounts["002"]!.getBalance())")
    print("Баланс аккаунта 003 после перевода: \(bank.accounts["003"]!.getBalance())")

    bank.moneyTransfer(sendAccount: "003", recipientAccount: "001", amount: 1000.0)
    print("Баланс аккаунта 003 после перевода: \(bank.accounts["003"]!.getBalance())")
    print("Баланс аккаунта 001 после перевода: \(bank.accounts["001"]!.getBalance())")
}

testDeposit()
testWithdraw()
testTransfer()
