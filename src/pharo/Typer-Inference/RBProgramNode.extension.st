Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotated: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfAnnotated: r ]
]
