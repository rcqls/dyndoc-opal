module.exports = function(opalParam) {
	// The Opal object that is exposed globally
	var Opal = this.Opal = {};
	//var Opal = opalParam || require('opal-npm-wrapper').Opal;

	//Use xmlhttprequest to emulate the browser XMLHttpRequest object.
	var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
	//Define overrideMimeType, not define by default in wrapper
	XMLHttpRequest.prototype.overrideMimeType = function() {};


