Extension { #name : #Exception }

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodSignal2: aLookup [
	<typShaMethod: 'signal:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: #()
		argumentsOptional: false
		signalsAlways: aLookup root receiver
]

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodSignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: #()
		argumentsOptional: false
		signalsAlways: aLookup root receiver
]
