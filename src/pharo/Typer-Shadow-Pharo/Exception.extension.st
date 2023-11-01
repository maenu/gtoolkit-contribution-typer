Extension { #name : #Exception }

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodKeywordSignal: aLookup root: anotherLookup [
	<typShaMethod: 'signal:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: anotherLookup receiver
		signalsMaybe: nil
]

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodUnarySignal: aLookup root: anotherLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: #()
		argumentsOptional: false
		signalsAlways: anotherLookup receiver
		signalsMaybe: nil
]
