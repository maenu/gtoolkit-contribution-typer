Class {
	#name : #TypVariableResolver,
	#superclass : #TypObjectResolver,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = receiverType and: [ anAssociation value = selector ]
]

{ #category : #'as yet unclassified' }
TypVariableResolver >> typeFor: anAssociation resolvedBy: anotherAssociation [
	self subclassResponsibility
]
