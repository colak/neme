var search = {
// configuration
config : {
formId : 'search', // id used for <form> element
sectionId : 'section', // id used for <select> element
sectionLabel : 'Section', // label text used for <select> element
allSectionsText : 'All sections' // <option>all sections</option>
},
	
// preps the form elements for action
init : function() {
// does the form exist? if not, quit now
if (!document.getElementById(search.config.formId)) return;
var searchForm = document.getElementById(search.config.formId);
// loop through all the form elements
for (i=0; i<searchForm.elements.length; i++) {
var el = searchForm.elements[i];
// if the elements are <selects>, continue
if (el.nodeName == 'SELECT') {
search.ifSection(el);
search.addEvent(el, 'change', function() { search.ifSection(this); });
}
}
},

// checks the values of the sites and if applicable, creates a section input
ifSection : function(el) {
switch (el.value) {
case 'http://www.neme.org/?m=any&q=':
search.createSection(section=[null, 'texts', 'projects', 'blog', 'about']);
break;

case 'http://respublika.neme.org/?m=any&q=':
search.createSection(section=[null, 'art-projects', 'exhibitions', 'festival', 'archive']);
break;

default:
search.removeSection();
};
},

// create's a section select and options
createSection : function(section) {
// if any section selects exist, remove them
search.removeSection();
// create label element
var label = document.createElement('label');
label.setAttribute('for', search.config.sectionId);
// create and attach label text
label.appendChild(document.createTextNode(search.config.sectionLabel));
// create select element
var select = document.createElement('select');
select.setAttribute('id', search.config.sectionId);
select.setAttribute('name', 'section');
// insert <select> into <label>
label.appendChild(select);
// build <option>s
for (i=0; i<section.length; i++) {
// create <option>
var option = document.createElement('option');
option.setAttribute('value', section[i]);
// create <option>text</option>
var optionText = document.createTextNode((section[i] === null) ? search.config.allSectionsText : section[i]);
option.appendChild(optionText);
// insert <option> into <select>
select.appendChild(option);
};
// insert <select> after first label
search.insertAfter(label, document.getElementById(search.config.formId).getElementsByTagName('label')[0]);
},

// helper function that makes up for the DOM's lack of insertAfter
insertAfter : function(newElement, targetElement) {
var parent = targetElement.parentNode;
if (parent.lastChild == targetElement) {
parent.appendChild(newElement);
} else {
parent.insertBefore(newElement, targetElement.nextSibling);
}
},

// removes any sections
removeSection : function() {
if (document.getElementById(search.config.sectionId)) {
var toRemove = document.getElementById(search.config.sectionId);
/*
The following is a little complex, but it saves a for loop. Key:
JS:    toRemove---->.parentNode---->.parentNode
HTML:  <select>----><label>--------><fieldset>
*/
toRemove.parentNode.parentNode.removeChild(toRemove.parentNode);
}
},

// cross-browser way to add events to objects
addEvent: function(obj, event, fn) {
// for the smart kids
if (obj.attachEvent) {
obj["e"+event+fn] = fn;
obj[event+fn] = function() { obj["e"+event+fn]( window.event ); }
obj.attachEvent( "on"+event, obj[event+fn] );
} else {
obj.addEventListener(event, fn, false);
}
}
};

// load search magic!
search.addEvent(window, 'load', search.init);
