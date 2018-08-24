public class recordtypeContactController {
	public static Map<Id, String> recordtypemap {get;set;}

   @AuraEnabled
    public static List<String> fetchRecordTypeValues(){
        List<Schema.RecordTypeInfo> recordtypes = Contact.SObjectType.getDescribe().getRecordTypeInfos();
        recordtypemap = new Map<Id, String>();
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() != 'Master')
            recordtypemap.put(rt.getRecordTypeId(), rt.getName());
        }
        return recordtypemap.values();
    }

    @AuraEnabled
    public static Id getRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Contact.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();
        return recid;
    }
}
