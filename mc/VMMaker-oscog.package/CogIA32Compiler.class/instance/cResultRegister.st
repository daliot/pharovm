accessing
cResultRegister
	"Answer the abstract register for the C result register.
	 Only partially implemented.  Works on x86 since TempReg = EAX = C result reg."
	^self abstractRegisterForConcreteRegister: EAX