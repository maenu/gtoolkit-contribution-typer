Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotated: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfAnnotated: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfContext [

	^ self typInfContextSelf: self methodNode methodClass typAsType
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfContextSelf: aType [

	^ self typInfContextSelf: aType super: aType super
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfContextSelf: aType super: anotherType [

	^ TypInfMethodNodeLookup node: self self: aType super: anotherType
]
