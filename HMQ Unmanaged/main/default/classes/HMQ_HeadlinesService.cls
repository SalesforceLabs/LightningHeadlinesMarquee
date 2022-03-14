public with sharing class HMQ_HeadlinesService {
    @AuraEnabled
    public static String getHeadlines(String deLimiter)
    {
        String healdlinesString='';
        try
        {
            checkFLS();
        }
        catch(Exception e)
        {
            throw new System.NoAccessException();
        }
        List<Headlines__c> headlines=[SELECT hmq__Content__c,hmq__Reference_Link__c from hmq__Headlines__c where hmq__Active__c =true ORDER BY hmq__Priority__c DESC];
        for(Headlines__c headline:headlines)
        {
            if(headline.hmq__Reference_Link__c!=null)
            {
                healdlinesString=healdlinesString+' '+headline.hmq__Content__c+' - <a href="'+headline.hmq__Reference_Link__c+'" target="_blank">More Details</a>  '+deLimiter+' ';
            }
            else
            {
                healdlinesString=healdlinesString+' '+headline.hmq__Content__c+' '+deLimiter+' ';
                
            }
        }
        return healdlinesString;
    }
    @AuraEnabled
    public static String getVerticalHeadlines(String deLimiter)
    {
        String healdlinesString='';
        try
        {
            checkFLS();
        }
        catch(Exception e)
        {
            throw new System.NoAccessException();
        }
        List<Headlines__c> headlines=[SELECT hmq__Content__c,hmq__Reference_Link__c  from hmq__Headlines__c where hmq__Active__c =true ORDER BY hmq__Priority__c DESC];
        for(Headlines__c headline:headlines)
        {
            if(headline.hmq__Reference_Link__c!=null)
            {
                healdlinesString=healdlinesString+' '+headline.hmq__Content__c+' - <a href="'+headline.hmq__Reference_Link__c+'" target="_blank">More Details</a><br>  '+deLimiter+'<br> ';
            }
            else
            {
                healdlinesString=healdlinesString+' '+headline.hmq__Content__c+' <br>'+deLimiter+'<br> ';
                
            }
        }
        return healdlinesString;
    }
    public static void checkFLS()
    {
        String [] headlinesAccessFields = new String [] {'hmq__Content__c',
            'hmq__Reference_Link__c',
            'hmq__Active__c',
            'hmq__Priority__c'            
            };
        Map<String,Schema.SObjectField> m = Schema.SObjectType.hmq__Headlines__c.fields.getMap();
        
        for (String fieldToCheck : headlinesAccessFields) {
            
            // Check if the user has access to view field
            if (!m.get(fieldToCheck).getDescribe().isAccessible()) {
                
                // Pass error to client
                throw new System.NoAccessException();
            }
        }
    }
    
}