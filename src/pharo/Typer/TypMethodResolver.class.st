Class {
	#name : #TypMethodResolver,
	#superclass : #TypObjectResolver,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: anAssociation resolvedBy: anotherAssociation [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: anAssociation [
	^ anAssociation key = receiverType and: [ anAssociation value key = selector ]
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resultTypeFor: anAssociation resolvedBy: anotherAssociation [
	self subclassResponsibility
]
