Extension { #name : #Exception }

{ #category : #'*Typer-Shadow-Pharo' }
Exception >> typShaMethodSignal: aLookup [
	<typShaMethod: 'signal'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: #()
		argumentsOptional: false
		signalsAlways: true
]
