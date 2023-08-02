Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotated: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfAnnotated: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNodeInContext: aContext [
	self subclassResponsibility
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNodeSelf [

	^ self typInfNodeSelf: self methodNode methodClass typAsType
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNodeSelf: aType [

	^ self typInfNodeSelf: aType super: aType superOrNil
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNodeSelf: aType super: anotherType [

	^ TypInfMethodResolver instance
		  nodeAt: self
		  self: aType
		  super: anotherType
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeSelf [

	^ self typInfTypeSelf: self methodNode methodClass typAsType
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeSelf: aType [

	^ self typInfTypeSelf: aType super: aType superOrNil
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeSelf: aType super: anotherType [

	^ TypInfMethodResolver instance
		  typeAt: self
		  self: aType
		  super: anotherType
]
