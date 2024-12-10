const express = require('express');
const bodyParser = require('body-parser');
const qr = require('qrcode');
const axios = require('axios');
require('dotenv').config();

// setting global attributes
var connectionId = null;
var retrievedAttribute = null;

// initiating the express js
const app = express();

// setting up the server side render engine
app.set('view engine', 'ejs');

// setting up various parsers
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
/*************************************************************
 *  ALL OF YOUR API SHOULD BE WRITTEN BELOW THIS LINE
 *************************************************************/

// YOU WILL WRITE CODE BETWEEN IN THIS AREA

app.get('/', (req, res) => {
  res.render('index');
});

// create an invitation for establishing connection
app.get('/newConnection', async (req, res) => {
  try {
    connectionId = null;
    const resp = await axios.post(
      'http://localhost:8021/connections/create-invitation'
    );
    if (resp) {
      const connectionID = resp.data['connection_id'];
      const inviteURL = JSON.stringify(resp.data['invitation_url'], null, 4);
      qr.toDataURL(inviteURL, (err, src) => {
        // passing the data to invitation.ejs page to show QR Code
        console.log({ src });
        res.render('invitationQr', { src, connectionID });
      });
    } else {
      res.render('index', { message: 'API service unavailable' });
    }
  } catch (err) {
    console.log('Filed to generate invitation');
    console.error(err);
  }
});


// Offer a VC
app.post('/offerCredential', async function(req,res) {
	try {
		const name = req.body.name
		const email = req.body.email
		const address = req.body.address
		const date = req.body.dob
	
		// fetching the Credential Definition
		const resp = await axios.get('http://127.0.0.1:8021/credential-definitions/created')
		
		// if not found end response
		if(!resp){
			res.end("API service unavailable")
			return 
		}

		const credID = resp.data['credential_definition_ids'][0];
		console.log("Credential ID : " + credID)
		if(credID){
			const data = {
				"auto_issue": true,
				"auto_remove": true,
				"connection_id": connectionId,
				"cred_def_id": credID,
				"comment":"Offer on cred def id " + credID,
				"credential_preview":{
					"@type":"https://didcomm.org/issue-credential/1.0/credential-preview",
					"attributes":[
            {
              "mime-type": "application/json",
              "name": "name",
              "value": name
            },
						{
              "mime-type": "application/json",
							"name":"date",
							"value":""+Date.now()
						},
						{
              "mime-type": "application/json",
							"name":"degree",
							"value":"BSC degree"
						},
						{
              "mime-type": "application/json",
							"name":"birthdate_dateint",
							"value":date
						},
						{
              "mime-type": "application/json",
							"name":"timestamp",
							"value": ""+Date.now()
						}
					]
				}
			};
			const result = await axios.post('http://127.0.0.1:8021/issue-credential/send-offer', data)
			res.render("index", { message: "VC sent. You will receive it soon....." })
		}
		
	} catch ( err ) {
		console.log( err )
	}
});

// receive webhook events upon state changes
app.post('/webhooks/*', (req, res, next) => {
  try {
    console.log('==================== webhook data ==================');
    console.log(req.body);
    console.log('==================== webhook data ==================');
    const conID = req.body['connection_id'];
    const conStatus = req.body['rfc23_state'];
    if (conID) {
      // Connection complete
      if (conStatus === 'completed') {
        console.log('=========== Connected Successful ============');
        connectionId = conID;
      }
      // Credential accepted by user from mobile
      if (req.body['state'] === 'credential_acked') {
        console.log('=========== Credential acknowledged by user ============');
      }
      // Proof request approved by user from mobile
      if (req.body.state === 'presentation_received') {
        const revealed_role =
          req.body?.presentation?.requested_proof?.revealed_attrs['vc_role']
            ?.raw ?? undefined;
        console.log('=========== Role Proved ===========');
        retrievedAttribute = revealed_role;
      }
    }
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Event Receied\n');
  } catch (err) {
    console.error(err);
  }
});

/*************************************************************
 *  ALL OF YOUR API SHOULD BE ABOVE THIS LINE
 *************************************************************/
app.listen(9999, () => {
  console.log('Server up at 9999');
  // global.connectionId = "44baf04c-911d-4191-9e84-e115c9101ec6"
});
