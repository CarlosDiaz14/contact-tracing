/**
 * @description       : 
 * @autor             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-27-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class CreateDocumentsWorkOrderController {
    @AuraEnabled(cacheable=true)
    public static List<Siniestro__c> getSiniestros(Id accountId) {
        return [

            SELECT Id, Numero_Siniestro__c
            FROM Siniestro__c
            WHERE Account__c = :accountId
        ];
    }

    @AuraEnabled
    public static Poliza__c getPolizaDetails(Id siniestroId) {
        Siniestro__c siniestro = [
            SELECT Poliza__c
            FROM Siniestro__c
            WHERE Id = :siniestroId
            LIMIT 1
        ];

        return [
            SELECT Id, Item__c, Vigencia__c, Corredor__c, Nombre_Asegurado__c, Rut_Asegurado__c, Direccion_Asegurado__c, 
                   Nombre_Beneficiario__c, Rut_Beneficiario__c, Direccion_Beneficiario__c, Tipo__c, Modelo__c, 
                   Patente__c, Chasis__c, Color__c, Marca__c, Ano__c, Numero_Motor__c, Uso__c
            FROM Poliza__c
            WHERE Id = :siniestro.Poliza__c
            LIMIT 1
        ];
    }
}