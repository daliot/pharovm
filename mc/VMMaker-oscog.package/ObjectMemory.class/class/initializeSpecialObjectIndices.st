initialization
initializeSpecialObjectIndices
	"Initialize indices into specialObjects array."

	NilObject := 0.
	FalseObject := 1.
	TrueObject := 2.
	SchedulerAssociation := 3.
	ClassBitmap := 4.
	ClassInteger := 5.
	ClassByteString := ClassString := 6. "N.B.  Actually class ByteString"
	ClassArray := 7.
	"SmalltalkDictionary := 8."  "Do not delete!"
	ClassFloat := 9.
	ClassMethodContext := 10.
	ClassBlockContext := 11.
	ClassPoint := 12.
	ClassLargePositiveInteger := 13.
	TheDisplay := 14.
	ClassMessage := 15.
	ClassCompiledMethod := 16.
	TheLowSpaceSemaphore := 17.
	ClassSemaphore := 18.
	ClassCharacter := 19.
	SelectorDoesNotUnderstand := 20.
	SelectorCannotReturn := 21.
	ProcessSignalingLowSpace := 22.	"was TheInputSemaphore"
	SpecialSelectors := 23.
	CharacterTable := 24.
	SelectorMustBeBoolean := 25.
	ClassByteArray := 26.
	ClassProcess := 27.
	CompactClasses := 28.
	TheTimerSemaphore := 29.
	TheInterruptSemaphore := 30.
	SelectorCannotInterpret := 34.
	"Was MethodContextProto := 35."
	ClassBlockClosure := 36.
	"Was BlockContextProto := 37."
	ExternalObjectsArray := 38.
	ClassMutex := 39.
	"Was: ClassTranslatedMethod := 40."
	ProcessInExternalCodeTag := 40.
	TheFinalizationSemaphore := 41.
	ClassLargeNegativeInteger := 42.

	ClassExternalAddress := 43.
	ClassExternalStructure := 44.
	ClassExternalData := 45.
	ClassExternalFunction := 46.
	ClassExternalLibrary := 47.

	SelectorAboutToReturn := 48.
	SelectorRunWithIn := 49.

	SelectorAttemptToAssign := 50.
	"PrimErrTableIndex := 51. in Interpreter class>>initializePrimitiveErrorCodes"
	ClassAlien := 52.
	SelectorInvokeCallback := 53.
	ClassUnsafeAlien := 54.

	ClassWeakFinalizer := 55.

	ForeignCallbackProcess := 56.

	SelectorUnknownBytecode := 57.
	SelectorCounterTripped := 58
