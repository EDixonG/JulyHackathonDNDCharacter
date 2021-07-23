({
	fetchData : function(component) {
		var action = component.get('c.characterList');
        action.setCallback(this, (function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var data = response.getReturnValue();
                component.set('v.data', data);
            } else if(state === "ERROR"){
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
	},
})