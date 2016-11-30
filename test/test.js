var should = require('chai').should();
var expect = require('chai').expect;
var assert = require('assert');
var SwaggerParser = require('swagger-parser');


// This is here because SwaggerParser is async, so we need to provide the done callback to mocha in order for it support async tests.
// https://mochajs.org/#asynchronous-code
describe('Validate Swagger Spec', function () {
    it('should be valid', function (done) {
        var myAPI = 'swagger.yaml';
        var foo = false;
        var theError = '';
        SwaggerParser.validate(myAPI, function (err, api) {
            if (err) {
                done(err);
            } else {
                console.log("API name: %s, Version: %s", api.info.title, api.info.version);
                done(); 
            }
        });
    });
});