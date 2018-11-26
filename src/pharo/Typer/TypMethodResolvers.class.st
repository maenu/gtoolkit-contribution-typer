Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: anAssociation [
	^ self typeFor: anAssociation using: [ :r | r argumentTypes at: anInteger ]
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typeForResultOfMethod: anAssociation [
	^ self typeFor: anAssociation using: [ :r :m | r resultType ]
]
