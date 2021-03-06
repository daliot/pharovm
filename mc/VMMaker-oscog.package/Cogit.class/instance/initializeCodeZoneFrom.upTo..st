initialization
initializeCodeZoneFrom: startAddress upTo: endAddress
	<api>
	self cCode: [self sqMakeMemoryExecutableFrom: startAddress To: endAddress]
		inSmalltalk: [self initializeProcessor].
	codeBase := methodZoneBase := (self
											cCode: [startAddress]
											inSmalltalk: [startAddress + guardPageSize]).
	minValidCallAddress := (codeBase min: coInterpreter interpretAddress)
								min: coInterpreter primitiveFailAddress.
	self initializeBackend.
	self maybeGenerateCheckFeatures.
	self maybeGenerateICacheFlush.
	self generateVMOwnerLockFunctions.
	ceGetSP := self cCoerceSimple: self genGetLeafCallStackPointer to: #'unsigned long (*)(void)'.
	self generateStackPointerCapture.
	self generateTrampolines.
	self checkPrimitiveTableEnablers.
	methodZone manageFrom: methodZoneBase to: endAddress.
	self computeEntryOffsets.
	self generateClosedPICPrototype.
	"N.B. this is assumed to be the last thing done in initialization; see Cogit>>initialized"
	self generateOpenPICPrototype