@isTest
public class OpportunityToOrderTestClass{
    static testMethod void testTrigger(){
        // Create test account
        Account testAccount = new Account(Name='Test Account');
        insert testAccount;
        // Create test pricebook
        Id PriceBookId = Test.getStandardPricebookId();
        // Create test product
        Product2 pro = new Product2(Name='Testproduct',IsActive=True);
        insert pro;
        // Create test pricebookentry
        PricebookEntry testpbookentry =new PricebookEntry();
        testpbookentry.Pricebook2Id =PriceBookId;
        testpbookentry.Product2Id =pro.Id;
        testpbookentry.UnitPrice =10.0;
        testpbookentry.IsActive=True;
        insert testpbookentry;
        // Create test opportunity
        Opportunity testOpportunity = new Opportunity(
            Name='Test Opportunity',
            StageName='Qualification',
            CloseDate=Date.today(),
            AccountId=testAccount.Id,
            Pricebook2Id=PriceBookId
        );
        insert testOpportunity;
        OpportunityLineItem testOppLineItem1 = new OpportunityLineItem(
            OpportunityId=testOpportunity.Id,
            Quantity=1,
            UnitPrice=10.0,
            Product2Id=pro.Id,
            pricebookentryid=testpbookentry.id
        );
        insert testOppLineItem1;
        OpportunityLineItem testOppLineItem2 = new OpportunityLineItem(
            OpportunityId=testOpportunity.Id,
            Quantity=2,
            UnitPrice=20.0,
            Product2Id=pro.Id,
            pricebookentryid=testpbookentry.id
        );
        insert testOppLineItem2;
        testOpportunity.StageName = 'Closed Won';
        ////update testOpportunity;  
        //System.debug('Oldmap:'+trigger.oldMap.get(testOpportunity.Id));
        update testOpportunity;
    }
}