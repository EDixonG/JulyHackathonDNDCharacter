public with sharing class descriptionCrontroller {
    @AuraEnabled
    public static List<Character__c> characterList(){
        List<Character__c> descriptionForHero = [Select Name, Description__c From Character__c];
		return descriptionForHero;
    }

}