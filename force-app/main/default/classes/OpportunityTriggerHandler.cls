public with sharing class OpportunityTriggerHandler extends TriggerHandler {
   public override void beforeUpdate(){
    marcarRevisionEnOportunidad((Map<ID, Opportunity>) Trigger.oldMap);

}  
   //Beforce
   private void marcarRevisionEnOportunidad(Map<ID, Opportunity> mapOldOppRecords){
    for(Opportunity currentOpportunity : (List<Opportunity>) Trigger.new){
       Opportunity oldOppRecord = mapOldOppRecords.get(currentOpportunity.Id); 
        if(oldOppRecord.Type        != currentOpportunity.Type &&
           oldOppRecord.StageName   != currentOpportunity.StageName &&
           oldOppRecord.Amount      != currentOpportunity.Amount){
            currentOpportunity.Necesita_Revision__c = true;
           }
    }
   }
}