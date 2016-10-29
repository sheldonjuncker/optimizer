module optimizer.joptimizer;
import semantic.variable;
import optimizer.warning;
import parser.all_nodes;
import std.stdio;

/**
* The JOptimizer class contains routines for optimizing an AST.
* The AST must first be semantically analyzed.
*/
class JOptimizer
{
	///The AST
	Node ast;

	///The Environment
	Environment env;

	/**
	* Removes all unused variables and displays warnings.
	*/
	void removeUnusedVariables()
	{
		//Used variables
		SemanticVar[] usedVars;

		//Check each variable
		foreach(SemanticVar var; env.vars)
		{
			//Get the underlying node
			VarDeclareNode node = var.var;

			//Check uses
			if(node.semInfo.uses == 0)
			{
				//Raise warning
				(new UnusedVarWarning(node.name, node.location)).display();
			}

			else
			{
				usedVars ~= var;
			}
		}

		//Remove all unused vars from list of variables
		env.vars = usedVars;
	}

	/**
	* Removes all nodes that have no effect.
	*/
	void removeUselessNodes()
	{
		//Go through AST and remove nodes that !hasEffect()
		static void removeUseless(ref Node node)
		{
			if(!node.hasEffect())
			{
				node = new NullNode;
			}
		}
		
		ast.each(&removeUseless);
	}

	/**
	* Constructs the optimizer.
	*/
	this(Node ast, Environment env)
	{
		this.ast = ast;
		this.env = env;
	}
}