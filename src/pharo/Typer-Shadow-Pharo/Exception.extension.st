Extension { #name : #Exception }

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodKeywordSignal: aLookup [
	<typShaMethod: 'signal:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: aLookup root receiver
		signalsMaybe: nil
]

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodUnarySignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: #()
		argumentsOptional: false
		signalsAlways: aLookup root receiver
		signalsMaybe: nil
]
