public class HardcodedSecretDemo {

    // Kaynak kodda gomulu kimlik bilgileri
    private static final String API_KEY   = 'AKIA1234567890EXAMPLE';
    private static final String PASSWORD  = 'SuperSecret123!';
    private static final String ENDPOINT  = 'http://internal-service.local/api';

    public HttpResponse callService(String payload) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(ENDPOINT);           // TLS yok
        req.setMethod('POST');
        req.setHeader('Authorization', 'Bearer ' + API_KEY);
        req.setBody(payload);
        return new Http().send(req);
    }
}
