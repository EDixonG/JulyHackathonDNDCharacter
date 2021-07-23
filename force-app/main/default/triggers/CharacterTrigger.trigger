trigger CharacterTrigger on Character__c (before insert) {
    switch on trigger.OperationType {
        when BEFORE_INSERT {
            CharacterTriggerHelper.randomize(trigger.new);
        }
    }
}