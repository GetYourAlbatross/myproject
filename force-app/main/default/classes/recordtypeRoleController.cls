public class recordtypeRoleController {
	public static Map<Id, String> recordtypemap {get;set;}

   @AuraEnabled
    public static List<String> fetchRecordTypeValues(){
        List<Schema.RecordTypeInfo> recordtypes = Lifeline_NB_Role__c.SObjectType.getDescribe().getRecordTypeInfos();
        recordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
            recordtypemap.put(rt.getRecordTypeId(), rt.getName());
        }
        return recordtypemap.values();
    }

    @AuraEnabled
    public static Id getRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Lifeline_NB_Role__c.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        return recid;
    }
}
