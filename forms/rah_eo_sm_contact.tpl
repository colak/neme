<!doctype html>
<head>
<meta charset="utf-8">
<meta name="ROBOTS" content="NOINDEX, NOFOLLOW"/>
<meta name="GOOGLEBOT" content="NOARCHIVE"> 

<style>
label, legend, .zemError {font-size:12px;font-family: sans-serif; -ms-text-size-adjust: 60%; -webkit-text-size-adjust: 60%;clear:both;display:block;text-align: left;display: block;}
fieldset {width:90%;clear:both;display:block;text-align: left;}
input, zemTextarea, #Message {width:90%;clear:both;display:block;text-align: left;clear:both;} 
select {margin-bottom:1em;text-align: left;}
.check {width: 100%;height: 1.5em;padding: 0;margin:0;vertical-align: bottom;position: relative;float:left;}
</style>

</head>
<body>

<txp:com_connect to_form="my_com_connect_to_form" subject="State_Machines_Inquiry" thanks="Thank you, your message has been sent.">
<txp:com_connect_text label="Your name" required="1" /><br />
<txp:com_connect_text label="Your surname" required="1" /><br />
<txp:com_connect_email label="Your email" name="Email" required="1" /><br />
<txp:com_connect_text label="Your website" required="0" /><br />
<txp:com_connect_select name="Organisation" label="Select organisation you wish to contact" options=",Project coordinator,Aksioma,Drugo More,Furtherfield,Institute of Network Cultures,NeMe" /><br />
<txp:com_connect_textarea label="Message" required="1" /><br />
To prove that this is not spam, check this box before clicking the send button.<br />
<txp:com_connect_checkbox class="check" label="" /><br />
<txp:com_connect_serverinfo name="REMOTE_ADDR" label="IP number" />
<txp:com_connect_serverinfo name="HTTP_USER_AGENT" label="Browser" />
<txp:com_connect_submit label="Send" />
</txp:com_connect>

</body>
</html>
