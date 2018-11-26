Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	| receiverType |
	receiverType := self typTypeForReceiverWithDiscovered: aSet.
	^ TypMethodResolvers instance typeForArgumentAt: anInteger ofMethod: receiverType -> selector
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiverWithDiscovered: aSet [
	^ receiver typTypeWithDiscovered: aSet
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResultWithDiscovered: aSet [
	| receiverType |
	receiverType := self typTypeForReceiverWithDiscovered: aSet.
	^ TypMethodResolvers instance typeForResultOfMethod: receiverType -> selector
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self typTypeForResultWithDiscovered: aSet
]
