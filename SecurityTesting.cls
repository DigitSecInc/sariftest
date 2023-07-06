public with sharing class SecurityTesting 
{
    public String foor {get; set;}
    public String testing {get; set;}
    
  	public string myInput  {get;set;}
  	public string myoutput {get;set;}
  	public string myhrefoutput {get;set;}
  Public void MyMethode(){
   myoutput = myInput ;
   myhrefoutput = myInput;
  }
    public SecurityTesting()
    {
    	String testing = 'This is a test';
        if(apexpages.currentpage().getparameters().get('Id') !=null) 
        {
        String test = ApexPages.currentPage().getParameters().get('Id');
  	     relatedCaseVulns(test);
        taintedfunc(test, 'static');
        }
    	
    }
    
    public void relatedCaseVulns(String test)
    {
  		String newtest = '\'' + test + '\''; 
        String gcase = 'Select Description from Case where ID=' + newtest;
        List<Case> a = Database.Query (gcase);
        relatedCaseVulns rcv = new relatedCaseVulns();
  		String res = rcv.SOQLInjCRUDByPass(myInput);
  		res = rcv.SOQLInjCRUDByPassProtection(res);
    }
    
    public void taintedfunc (String v, 
    String f)
    
    {
        try
        {
        String gg = v;
        String gcase = 'Select Name, Description from Account where Name = \'John \' and ID=' + '\'' + v + '\'';
        List<Account> a = database.query (gcase);
        }catch (Exception e)
        {
        }
    }
    
    @RemoteAction
    public static string testing(ID testid)
    {
       
        List<Account> act = [Select ID, Name from Account LIMIT 1];
        if(testid == null){delete (act);}
        return testid;
       
    }

}