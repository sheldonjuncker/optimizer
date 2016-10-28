module optimizer.warning;
import lexer.token;
import std.stdio;

/**
* The base warning class used in the optimizer.
* The optimizer does not produce errors.
*/
class OptimizerWarning
{
	///The warning message
	string msg;

	/**
	* Constructs the warning.
	*/
	this(string msg)
	{
		this.msg = msg;
	}

	/**
	* Displays the warning.
	*/
	void display()
	{
		writeln("Warning: " ~ msg);
	}
}

/**
* Warning is raised when an unused variable is found.
*/
class UnusedVarWarning : OptimizerWarning
{
	/**
	* Constructs the warning.
	*/
	this(string name, TokenLocation location)
	{
		super("Unused variable " ~ name ~ " at " ~ location.toString());
	}
}