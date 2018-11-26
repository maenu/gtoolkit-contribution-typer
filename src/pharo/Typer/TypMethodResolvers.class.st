Class {
	#name : #TypMethodResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolvers >> typeForArgumentAt: anInteger ofMethod: anAssociation withDiscovered: aSet [
	^ self typeFor: anAssociation using: [ :r | r argumentTypes at: anInteger ]
]

{ #category : #'as yet unclassified' }
TypMethodResolvers >> typeForResultOfMethod: anAssociation withDiscovered: aSet [
	^ self typeFor: anAssociation using: [ :r :m | r resultType ]
]
