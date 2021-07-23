public class backstoryGenerator {
    public static string getStory(String charName, String characterClass){
        String colorString = backstoryGenerator.getColorString();
        Incident_String__c incident = backstoryGenerator.getIncident(backstoryGenerator.getClassCategory(characterClass));
        String incidentString = incident.Inciting_Incident__c;
		String consequenceString = backstoryGenerator.getConsequence(incident);
        String story = charName + ' was a ' + randomDNDBackground.getBG() + ' ' + colorString + ' until '+ incidentString + ', ' + consequenceString + '.';
        return story;
    }
    
    public static string getColorString(){
        List<Color_String__c> colorStringList = [SELECT id, Colorful_String__c FROM Color_String__c];
        if(colorStringList.isEmpty()){
            return 'ERROR';
        }
        Integer colorStringIndex = (math.random()*colorStringList.size()).intValue();
        String colorStringSelected = colorStringList[colorStringIndex].Colorful_String__c;
        return colorStringSelected;
    }
    
    public static Incident_String__c getIncident(String category){
        List<Incident_String__c> incidentList = [SELECT id, Inciting_Incident__c, Consequence_Category__c FROM Incident_String__c WHERE Category__c = :category];
        if(incidentList.isEmpty()){
            return new Incident_String__c(Inciting_Incident__c='ERROR', Consequence_Category__c='Crime');
        }
        Integer index = (math.random()*incidentList.size()).intValue();
        return incidentList[index];
    }
    
    public static string getConsequence(Incident_String__c incident){
        String [] consequenceCategories = incident.Consequence_Category__c.split(';');
        if(consequenceCategories.isEmpty()){
            return 'ERROR';
        }
		Integer index = (math.random()*consequenceCategories.size()).intValue();
        String category = consequenceCategories[index];
        List<Consequence_String__c> consequences = [SELECT id, Consequence__c FROM Consequence_String__c WHERE Consequence_Category__c =:category];
        if(consequences.isEmpty()){
            return 'ERROR';
        }
        index = (math.random()*consequences.size()).intValue();
        return consequences[index].Consequence__c;
    }
    
    public static String getClassCategory(String characterClass){
        //'Arcane', 'Religious', 'War', 'Crime', 'Mystery'
        List<String> categories = new List<String>();
        switch on characterClass.toLowerCase() {
            when 'artificer', 'wizard', 'sorceror', 'druid', 'bard'{
                categories.add('Arcane');
                categories.add('Mystery');
            }when 'barbarian', 'ranger'{
                categories.add('Mystery');
            }when 'cleric', 'paladin', 'monk'{
                categories.add('Religious');
                categories.add('War');
            }when 'fighter'{
                categories.add('War');
                categories.add('Mystery');
            }when 'rogue'{
                categories.add('Crime');
                categories.add('Mystery');
            }when 'warlock' {
                categories.add('Arcane');
                categories.add('Crime');
            }when else{
                categories.add('Mystery');
            }
        }
        Integer index = (math.random()*categories.size()).intValue();
        return categories[index];
    }
}