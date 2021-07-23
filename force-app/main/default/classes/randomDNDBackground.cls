public class randomDNDBackground {
    public static String getBG(){
        List<String> backgrounds = new List<String>{'Charlatan', 'Entertainer', 'Folk Hero', 'Gladiator', 'Merchant', 'Knight', 'Pirate','Scholar','Sailor','Soldier','Beggar','Farmer'};
    	Integer index = (math.random()*backgrounds.size()).IntValue();
        return backgrounds[index];
        }
}