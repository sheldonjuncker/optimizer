module optimizer.joptimizer;
import parser.all_nodes;

/**
* The JOptimizer class contains routines for optimizing an AST.
* The AST must first be semantically analyzed.
*/
class JOptimizer
{
	///The AST
	Node ast;

	/**
	* Constructs the optimizer.
	*/
	this(Node ast)
	{
		this.ast = ast;
	}
}