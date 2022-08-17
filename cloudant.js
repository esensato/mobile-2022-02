function main(params) {

console.log('------> ', params.nome)

var auth = require('ibm-cloud-sdk-core');
var Cloudant = require('@ibm-cloud/cloudant');

const authenticator = new auth.IamAuthenticator({
  apikey: 'TEmnuQIVKJmv-dV-ydrjHvWBLOZ9Bmd89Jigq-lCQ8NT',
});

var cloudant =  Cloudant.CloudantV1.newInstance( {authenticator: authenticator });


cloudant.setServiceUrl('https://246a1fed-5869-43e9-a60b-80d330e9efc0-bluemix.cloudantnosqldb.appdomain.cloud');
const dbname = 'pizzaria';

// create mydb database if it does not already exist

    return new Promise((resolve, reject) => {

cloudant.postDocument({ db: dbname, document: {nome: "teste"}})
  .then(data => {
    resolve(prepararRetorno({msg: "criado"}))
  })
  .catch(error => {
    // ignore if database already exists
    if (error.status === 412) {
      reject(dbname + ' database already exists');
    } else {
        console.log(error)
      reject('Error occurred when creating ' + dbname +
      ' database', error.error);
    }
  });        


    })

}


function prepararRetorno(mensagem, codigo) {

   return {
     body: mensagem,
     statusCode: codigo,
     headers:{ 'Content-Type': 'application/json'}
   };
  

}
