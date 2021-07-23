public class CharacterTriggerHelper {
    public static void randomize(List<Character__c> charList) {
        
        final String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
        String name = '';
        while (name.length() < 7) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), chars.length());
            name += chars.substring(idx, idx+1);
        }
        
        for (Character__c c: charList) {
            if(c.Name==null) {
                c.Name = name;
            }
            if(c.Strength__c == null){
                c.Strength__c = Integer.valueOf(math.random()*10);               
            }
            if(c.Dexterity__c == null){
                c.Dexterity__c = Integer.valueOf(math.random()*10);               
            }
            if(c.Constitution__c == null){
                c.Constitution__c = Integer.valueOf(math.random()*10);               
            }
            if(c.Intelligence__c == null){
                c.Intelligence__c = Integer.valueOf(math.random()*10);               
            }
            if(c.Wisdom__c == null){
                c.Wisdom__c = Integer.valueOf(math.random()*10);               
            }
            if(c.Charisma__c == null){
                c.Charisma__c = Integer.valueOf(math.random()*10);               
            }
            if(c.Age__c == null){
                c.Age__c = Integer.valueOf(math.random()*800);               
            }
            
            if (c.Hair_Color__c == null) {
                Schema.DescribeFieldResult fieldResult = Character__c.Select_Hair_Color__c.getDescribe();
                List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                List<String> hairColors = new List<String>();
                for(Schema.PicklistEntry pp:ple) {
                    hairColors.add(pp.getValue());
                }
                c.Select_Hair_Color__c = hairColors[Integer.valueOf(math.random()*(hairColors.size() -  1))];
                c.Hair_Color__c = c.Select_Hair_Color__c;
            }
            
            if (c.Select_Eye_Color__c == null) {
                Schema.DescribeFieldResult fieldResult = Character__c.Select_Eye_Color__c.getDescribe();
                List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                List<String> eyeColors = new List<String>();
                for(Schema.PicklistEntry pp:ple) {
                    eyeColors.add(pp.getValue());
                }
                c.Select_Eye_Color__c = eyeColors[Integer.valueOf(math.random()*(eyeColors.size() -  1))];
                c.Eye_Color__c = c.Select_Eye_Color__c;
            }
            
            if (c.Class__c == null) {
                Schema.DescribeFieldResult fieldResult = Character__c.Class__c.getDescribe();
                List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                List<String> classes = new List<String>();
                for(Schema.PicklistEntry pp:ple) {
                    classes.add(pp.getValue());
                }
                c.Class__c = classes[Integer.valueOf(math.random()*(classes.size() -  1))];
            }
            
            if (c.Gender__c == null) {
                Schema.DescribeFieldResult fieldResult = Character__c.Gender__c.getDescribe();
                List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                List<String> genders = new List<String>();
                for(Schema.PicklistEntry pp:ple) {
                    genders.add(pp.getValue());
                }
                c.Gender__c = genders[Integer.valueOf(math.random()*(genders.size() -  1))];
            }
            
            if (c.Race__c == null) {
                Schema.DescribeFieldResult fieldResult = Character__c.Race__c.getDescribe();
                List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
                List<String> races = new List<String>();
                for(Schema.PicklistEntry pp:ple) {
                    races.add(pp.getValue());
                }
                c.Race__c = races[Integer.valueOf(math.random()*(races.size() -  1))];
            }
            
            if (c.Description__c == null) {
                c.Description__c = backstoryGenerator.getStory(c.Name, c.Class__c);
            }
        }  
    }
}