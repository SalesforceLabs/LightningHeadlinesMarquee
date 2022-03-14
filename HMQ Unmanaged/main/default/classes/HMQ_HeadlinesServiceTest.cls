@isTest(SeeAllData=true)
private class HMQ_HeadlinesServiceTest {
    static testmethod void getHorizontalHeadlinesTest() 
    {
        String testString1=HMQ_HeadlinesService.getHeadlines('|');
        String testString2=HMQ_HeadlinesService.getVerticalHeadlines('|');
        System.debug(testString1+'---'+testString2);
        System.assert(testString1 != null);
        System.assert(testString2 != null);

    }
}