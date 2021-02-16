<div class="grid_8"><p>Did you write an article mentioning NeMe in any way? Did you write an article citing any of our books or content in this website?</p>
<p>Do send us the pdf of your text or book, and the remaining information we require, and we will be adding it to our list.</p></div>
<div class="grid_16">
<txp:com_connect to='<txp:authors name="colak"><txp:author_email /></txp:authors>' label="" thanks="thank you your submission will be reviewed shortly." subject="NeMe Citations">
 <txp:com_connect_text name="FirstName" label="Your Name:" required="1" class="grid_24" /><br />
 <txp:com_connect_text name="LastName" label="Your Surame:" required="1" class="grid_24" /><br />
 <txp:com_connect_email name="Email" label="Your Email:" required="1" class="grid_24" /><br />
 <txp:com_connect_text label="Your website:" required="0" class="grid_24" /><br />
 <txp:com_connect_text name="PublicationTitle" label="Publication Title:" required="1" class="grid_24" /><br />
 <txp:com_connect_text name="PublicationURL" label="Publication URL:" required="1" class="grid_24" /><br />
 <txp:com_connect_file label="Select file" max="8000000" accept=".pdf" required="1" /><br />
 <txp:com_connect_checkbox required="0" label="Check this box if you wish to subscribe to our newsletter." /><br />
 <txp:com_connect_checkbox label="This is not spam" /><br />
<txp:com_connect_secret label="This article"><txp:if_section><txp:section /></txp:if_section><txp:if_category><txp:category /></txp:if_category></txp:com_connect_secret>
 <txp:com_connect_serverinfo name="REMOTE_ADDR" label="IP number" />
 <txp:com_connect_serverinfo name="HTTP_USER_AGENT" label="Browser" /><br />
 <txp:com_connect_submit label="Submit" />
 </txp:com_connect>
</div>
<div class="clear">&nbsp;</div>
