Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaVariableResolver >> resolversFor: aLookup [
	^ {shadow instVarNamed: '_' , aLookup selector}
]

{ #category : #accessing }
TypShaVariableResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass and: [ aLookup receiverType asClass == shadow shadowedClass and: [ shadow hasInstVarNamed: '_' , aLookup selector ] ]
]
