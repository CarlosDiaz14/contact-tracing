public class MyBank {
    
    private Decimal balance = 0;
    
    private static decimal combinedAccountBalance = 0;
    
    public void deposito (Decimal amount){
        balance += amount;
        combinedAccountBalance += amount;
    }
	
    public void withdraw(Decimal amount){
        balance -= amount;
        combinedAccountBalance -= amount;
    }
    
    public Decimal getAccountBalance(){
        return balance;
    }
    
    public static Decimal getCombinedAccountBalance(){
        return combinedAccountBalance;
    }
}