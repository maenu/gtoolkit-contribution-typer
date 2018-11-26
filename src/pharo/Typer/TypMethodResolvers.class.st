Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: anAssociation [
	^ self typeFor: anAssociation using: [ :r :a | r argumentTypeAt: anInteger for: anAssociation resolvedBy: a ]
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typeForResultOfMethod: anAssociation [
	^ self typeFor: anAssociation using: [ :r :a | r resultTypeFor: anAssociation resolvedBy: a ]
]
