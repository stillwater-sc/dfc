var cli = module.exports;

cli.main = function Main(opts) {
    "use strict";
    opts = opts || {};
    var lexFile = {};

    function generateParser(file) {
		"use strict";
		lexFile = lexFile || false;
		var ebnfParser = require('ebnf-parser');

		var grammar;
		try {
			console.log("ebnfMode " + ebnfParser);
			grammar = ebnfParser.parse(file);
		} catch (e) {
		    throw new Error('Could not parse grammar');
		}
		try {
		    if (lexFile) {
				grammar.lex = require('lex-parser').parse(lexFile);
		    }
		} catch (e) {
		    throw new Error('Could not parse lex grammar');
		}
		return grammar;
    }

    if (opts.file) {
		generateParser(opts.file)
    } else {
		console.log('Please provide a grammar');
    }

};

function getOpts() {
    "use strict";
    var opts = require('nomnom')
	.option('file', {
	    flag : true,
	    position : 0,
	    help : 'file containing a grammar'
	})
        .parse();
    return opts;
}

if (require.main === module) {
    var opts = getOpts();
    console.log(opts)
    cli.main(opts);
    console.log(cli)
} else {
    console.log("Not called as module")
}
