initialization
initialize
	"This method intializes the Smalltalk instance.  The C instance is merely a struct and doesn't need initialization."
	<doNotGenerate>
	operands := CArrayAccessor on: (Array new: 3).
	machineCode := CArrayAccessor on: (ByteArray new: self machineCodeBytes)