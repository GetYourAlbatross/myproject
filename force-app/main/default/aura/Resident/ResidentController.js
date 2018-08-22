({
  myAction: function (component, event, helper) {
    // For setting Columns in the grid display
    component.set("v.Columns", [{
        label: "First Name",
        fieldName: "FirstName",
        type: "text"
      },
      {
        label: "Last Name",
        fieldName: "LastName",
        type: "text"
      },
      {
        label: "Email",
        fieldName: "Email",
        type: "email"
      },
      {
        label: "Phone",
        fieldName: "Phone",
        type: "phone"
      }
    ]);
    // action is a reference for get Residents() function
    var action = component.get("c.getResidents");
    // set the parameters to be passed to getContacts
    action.setParams({
      recordId: component.get("v.recordId")
    });
    // call back function
    action.setCallback(this, function (data) {
      // getReturnValue() will return the list of Contacts retrieved, assign this to v.Contacts list
      component.set("v.Residents".data.getReturnValue());
    });
    // enqueueAction() is the server-side controller action to the queue of actions to be executed.
    $A.enqueueAction(action);
  },
  newResident: function (component, event, helper) {
    // Assign global event e.force:createRecord to createResident variable
    // here $A is used to reference the global event e.force:createRecord
    var createResident = $A.get("e.force.createRecord");
    // set the parameters for createContact variable
    // entity API name points to the object for which we need to create record
    // defaultFieldValues is used to assign default values for AccountID field
    // here wew are assigning AccountId to v.recordId for referencing current account
    createResident.setParams({
      'entityApiName': 'Resident',
      'defaultFieldValues': {
        'AccountId': component.get("v.recordId")
      }
    });
    // Fire the event which will make sure the new Contact dialog box should be displayed
    createResident.fire();
  }
})
