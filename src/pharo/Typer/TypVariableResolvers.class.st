Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typeForVariable: anAssociation [
	^ self typeFor: anAssociation using: [ :r :a | r type ]
]
