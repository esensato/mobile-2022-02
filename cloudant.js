function main(params) {
    
    var auth = require('ibm-cloud-sdk-core');
    var Cloudant = require('@ibm-cloud/cloudant');
    
    const authenticator = new auth.IamAuthenticator({
        apikey: 'q6qJgMqMqgkCOVqsOUHg4gSm_Ui7P5_JmSSBnHCaNsQc',
    });
    
    var client =  Cloudant.CloudantV1.newInstance( {authenticator: authenticator });
    client.setServiceUrl('https://9927172e-6dc6-480b-bae7-fed88d632838-bluemix.cloudantnosqldb.appdomain.cloud');

    return new Promise((process, reject) => {
        
        client.postDocument({db: 'pedidos', document: {pizza: "4 Queijos"}})
        .then((ok) => process({ body: ok }))
        .catch((err) => reject({body: err}))
        
    })
}
