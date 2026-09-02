public without sharing class SoqlInjectionDemo {

    // Kullanici girdisi dogrudan sorguya birlestiriliyor -> SOQL injection
    public List<Account> searchAccounts(String nameFilter) {
        String q = 'SELECT Id, Name, Phone FROM Account WHERE Name LIKE '%' + nameFilter + '%'';
        return Database.query(q);
    }

    // Ikinci varyant: ORDER BY uzerinden
    public List<Contact> listContacts(String sortField) {
        return Database.query('SELECT Id, LastName FROM Contact ORDER BY ' + sortField);
    }

    // CRUD/FLS kontrolu yok, dogrudan DML
    public void deleteAll(List<Id> ids) {
        delete [SELECT Id FROM Account WHERE Id IN :ids];
    }
}
