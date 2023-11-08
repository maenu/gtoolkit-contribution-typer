Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> startWithoutParentheses [
	^ self start
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> stopWithoutParentheses [
	^ self stop
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotated: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfAnnotated: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfContextLookup [
	^ TypInfContextLookup
		node: self
		arguments: #()
		self: nil
		super: nil
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfNodeInContext: aContext [
	self subclassResponsibility
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfRootNodeInContext: aContext [
	^ TypInfExpression node: self context: aContext
]
