public class CreateOrdersForEachOpportunityLineItem {
    // Working for create an orders for each opportunity lineItem
    /*public static void createOrder(List<Opportunity> Opps, Map<Id,Opportunity> BeforOppValues){
//  if(Opps.size()>0){
Set<Id> Opportunity1=new Set<Id>();
Id Accid;
Id Pricebook2Id;
for(Opportunity ListOpps:Opps){
if(ListOpps.StageName=='Closed Won' && BeforOppValues.get(ListOpps.Id).StageName !='Closed Won'){
Opportunity1.add(ListOpps.Id);
Accid=ListOpps.AccountId;
Pricebook2Id=ListOpps.Pricebook2Id;
} 
}
List<OpportunityLineItem> ListOfLineItems =[Select Id,ListPrice,Product2Id,PricebookEntryId,OpportunityId,Quantity,UnitPrice From OpportunityLineItem Where OpportunityId in:Opportunity1];
List<Order> CreateEachOrder= new List<Order>();
List<OrderItem> CreateEachOrderLineItem= new List<OrderItem>();
for(OpportunityLineItem Ops:ListOfLineItems){
Order ord=new Order();
ord.OpportunityId=Ops.OpportunityId;
ord.EffectiveDate=Date.newInstance(2023, 12, 9);
ord.Status='Draft';
ord.Pricebook2Id = Pricebook2Id;
ord.AccountId=AccId;
CreateEachOrder.add(ord);
OrderItem ordLI=new OrderItem();
ordLI.ListPrice=Ops.ListPrice;
ordLI.Quantity=Ops.Quantity;
ordLI.Product2Id=Ops.Product2Id;
ordLI.PricebookEntryId= Ops.PricebookEntryId;
ordLI.UnitPrice=Ops.UnitPrice;
CreateEachOrderLineItem.add(ordLI);
} Insert CreateEachOrder;
for (integer i=0; i<CreateEachOrder.size(); i++){
CreateEachOrderLineItem[i].OrderId=CreateEachOrder[i].Id;
}
Insert CreateEachOrderLineItem;
//  }
}*/
    //Working for the Single order with multiple line items
    public static void createOrder(List<Opportunity> Opps, Map<Id,Opportunity> BeforOppValues){
        System.debug('List of line items');
        //if(Opps.size()>0){
        System.debug('List of line items0');
        Set<Id> Opportunity1=new Set<Id>();
        List<Order> CreateEachOrder= new List<Order>();
        for(Opportunity ListOpps:Opps){
            if(ListOpps.StageName=='Closed Won' && BeforOppValues.get(ListOpps.Id).StageName !='Closed Won' && ListOpps.HasOpportunityLineItem ==TRUE){
                Opportunity1.add(ListOpps.Id);
                Order ord=new Order();
                ord.OpportunityId=ListOpps.Id;
                ord.EffectiveDate=Date.newInstance(2023, 12, 9);
                ord.Status='Draft';
                System.debug('PricebookId:'+ListOpps.Pricebook2Id);
                ord.Pricebook2Id=ListOpps.Pricebook2Id;
                ord.AccountId=ListOpps.AccountId;
                CreateEachOrder.add(ord);
                System.debug('List of line items1');
            }
        }
        Insert CreateEachOrder;
        System.debug('List of line items1:'+CreateEachOrder);
        List<OpportunityLineItem> ListOfLineItems =[Select Id,ListPrice,Product2Id,PricebookEntryId,OpportunityId,Quantity,UnitPrice From OpportunityLineItem Where OpportunityId=: Opportunity1];
        List<OrderItem> CreateEachOrderLineItem= new List<OrderItem>();
        for(OpportunityLineItem Ops:ListOfLineItems){
            OrderItem ordLI=new OrderItem();
            ordLI.ListPrice=Ops.ListPrice;
            ordLI.Quantity=Ops.Quantity;
            ordLI.Product2Id=Ops.Product2Id;
            ordLI.OrderId=CreateEachOrder[0].Id;
            ordLI.PricebookEntryId= Ops.PricebookEntryId;
            ordLI.UnitPrice=Ops.UnitPrice;
            CreateEachOrderLineItem.add(ordLI);
        }
        Insert CreateEachOrderLineItem;
        System.debug('List of line items'+CreateEachOrderLineItem);
        System.debug('List of line items'+ListOfLineItems);
        System.debug('List of line items'+CreateEachOrder);
        System.debug('Insert order'+CreateEachOrder);
        //}
    }
}