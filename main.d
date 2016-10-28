module optimizer.main;
import optimizer.joptimizer;
import semantic.analyzer;
import parser.j_parser;
import std.stdio;

int main()
{
	//Create a new parser
	Parser p = new Parser("../code.txt");

	//Lex and parse input
	p.lex();
	p.parse();

	//Print AST
	writeln("AST:");
	p.ast.print();

	//Analyze the resulting AST
	SemanticAnalyzer a = new SemanticAnalyzer(p.ast);
	a.analyzeVariables();

	//Load the modified AST into the optimizer
	JOptimizer o = new JOptimizer(a.ast);

	//Reprint the modified AST
	writeln("\n\nOptimized AST:");
	o.ast.print();

	return 0;
}