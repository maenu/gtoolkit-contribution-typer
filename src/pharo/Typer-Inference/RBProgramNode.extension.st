Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfAnnotated: aType [
	"Annotates aType according to my comments used for casting and setting parameters."

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	^ self comments inject: aType into: [ :r :e | e typInfType: r ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfIsMessageArgument [

	^ parent isNotNil and: [ 
		  parent isMessage and: [ parent arguments includes: self ] ]
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeIn: aContext [

	<typPraResult: 'TypType'>
	^ aContext type: self
]

{ #category : #'*Typer-Inference' }
RBProgramNode >> typInfTypeRecursiveIn: aContext [

	<typPraResult: 'TypType'>
	^ aContext unknown: self
]
