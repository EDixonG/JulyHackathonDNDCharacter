public class generateStats {
    @InvocableMethod(label='Get Random Stats' description='Return a list of random stats. 0-Strength, 1-Dexterity, 2-Constitution, 3-Intelligience, 4-Wisdom, 5-Charisma')
    public static List<Integer> getmyStat(){
        Integer myEnd =10;
        Integer str = Integer.valueOf(math.random()*myEnd);
        Integer dex = Integer.valueOf(math.random()*myEnd);
        Integer consti = Integer.valueOf(math.random()*myEnd);
        Integer intel = Integer.valueOf(math.random()*myEnd);
        Integer wis = Integer.valueOf(math.random()*myEnd);
        Integer charis = Integer.valueOf(math.random()*myEnd);
        
        system.debug('Strength: '+str);
        system.debug('Dexterity: '+dex);
        system.debug('Constitution: '+consti);
        system.debug('Intelligience: '+intel);
        system.debug('Wisdom: '+wis);
        system.debug('Charisma: '+charis);
        
        
        List<Integer> result = new  List<Integer>();
       	result.add(str);
        result.add(dex);
        result.add(consti);
        result.add(intel);
        result.add(wis);
        result.add(charis);
        return result;
    }

}