trigger OpportunityTrigger on Opportunity (after update) {
if(Trigger.isAfter && Trigger.isUpdate){
       CreateOrdersForEachOpportunityLineItem.createOrder(Trigger.New, Trigger.oldMap);
      // CreateOrdersForEachOpportunityLineItem.handleClosedWonOpportunity(Trigger.New);
    }
}