Extension { #name : #Exception }

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodSignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: #()
		argumentsOptional: false
		signalsAlways: true
]
