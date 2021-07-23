({
	fetchData : function(component, event, helper) {
        component.set('v.columns',[
            { label: 'Character', fieldName: 'Name', type: 'text'},
            { label: 'Description', fieldName: 'Description__c', type: 'text'},
        ]);
            
        helper.fetchData(component);
		
	}
})