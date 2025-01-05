/**
 * @description       : 
 * @author            : Carlos Leandro Díaz Véliz
 * @group             : 
 * @last modified on  : 12-22-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CTPersonController {

    public static String getToken(String phoneMumber){
        Blob value = Blob.valueOf(phoneMumber);
        Blob hash = Crypto.generateDigest('MD5', value);

        //get the string value of hash blob
        return EncodingUtil.base64Encode(hash);
    }

    public static List <Person__c> getRecentHealthChanges (){
        return [SELECT Id, CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, Status_Update_Date__c, Token__c 
                FROM Person__c 
                ORDER BY Status_Update_Date__c Desc 
                Limit 100];
    }

    public static List<Person__c> searchPeople(String searchTerm){
        searchTerm = searchTerm + '%';
        return [SELECT Id, CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, Status_Update_Date__c, Token__c 
                FROM Person__c 
                WHERE Name LIKE :searchTerm
                OR Mobile__c LIKE :searchTerm
                OR Token__c LIKE :searchTerm
                ORDER BY Status_Update_Date__c Desc];
    }

    public static Person__c getPersonById(String personId){
        List<Person__c> people = [SELECT Id, CreatedById, Health_Status__c, LastModifiedById, Mobile__c, Name, Status_Update_Date__c, Token__c 
                FROM Person__c 
                WHERE Id =: personId];
        
        if(people != null && people.size() > 0){
            return people[0];
        }

        return null;
    }
}