Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Core' }
RBBlockNode >> typResultType [
	<typTypeResultAs: 'TypType'>
	^ ((self typType) "typCastAs TypFunctionType") result
]

{ #category : #'*Typer-Core' }
RBBlockNode >> typTypeRecursive [
	^ BlockClosure
		typAsFunctionTypeWithArguments: (self arguments collect: [ :e | e typType ])
		result: (self body typType)
		argumentsOptional: false
]
