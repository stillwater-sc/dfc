#!/usr/bin/env node

function getCommandLineOptions() {
	    "use strict";
    var version = '0.0.1'; // require('./package.json').version;
    var opts = require("nomnom")
        .script('lexer')
        .option('lexfile', {
            position : 0,
            help : 'file containing the syntax specification'
        })
        .option('file', {
            position : 1,
            help : 'file containing the language to tokenize'
        })
        .option('version', {
            abbr : 'V',
            flag : true,
            help : 'print version and exit',
            callback : function () {
                return version;
            }  
        }).parse();
    return opts;
}

var cli = module.exports;

cli.main = function cliMain(opts) {
    "use strict";
    opts = opts || {};

    function processInputFile() {
    	console.log('Processing ' + opts.file + ' with ' + opts.lexfile);

    	var fs  = require('fs')
		var JisonLex = require('jison-lex');

		var syntax = fs.readFileSync(opts.lexfile, 'utf8');
		var lexer  = new JisonLex(syntax);
		var input  = fs.readFileSync(opts.file, 'utf8');

		lexer.setInput(input);
		var token = lexer.lex();
		while (token !== 'ENDOFFILE') {
			console.log('Token : ' + token);
			token = lexer.lex();
		}
		console.log('Done...');
    }

    if (opts.lexfile && opts.file) {
    	processInputFile();
    } else {
    	console.log('Missing attributes')
    }
};

if (require.main === module) {
	var opts = getCommandLineOptions();
	console.log(opts)
	cli.main(opts)
}
