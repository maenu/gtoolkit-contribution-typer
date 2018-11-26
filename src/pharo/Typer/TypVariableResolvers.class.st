Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolvers >> typeForVariable: anAssociation withDiscovered: aSet [
	^ self typeFor: anAssociation using: [ :r :a | r type ]
]
