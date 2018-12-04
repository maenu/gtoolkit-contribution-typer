Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaVariableResolver >> resolverFor: aLookup [
	^ shadow instVarNamed: '_' , aLookup selector
]

{ #category : #accessing }
TypShaVariableResolver >> resolves: aLookup [
	^ aLookup receiverType == shadow shadowedClass and: [ shadow hasInstVarNamed: '_' , aLookup selector ]
]
