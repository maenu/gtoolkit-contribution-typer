Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typMethod [
	^ self typMethodWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typMethodWithDiscovered: aSet [
	^ (self typTypeForReceiverWithDiscovered: aSet) lookupMethodSelector: selector
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger [
	^ self typTypeForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ (self typMethodWithDiscovered: aSet) ifNil: [ TypUnknownType instance ] ifNotNil: [ :e | e typTypeForArgumentAt: anInteger withDiscovered: aSet ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiver [
	^ self typTypeForReceiverWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiverWithDiscovered: aSet [
	^ receiver typTypeWithDiscovered: aSet
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResult [
	^ self typTypeForResultWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResultWithDiscovered: aSet [
	^ (self typMethodWithDiscovered: aSet)
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ :e | e typTypeForResultForReceiver: (self typTypeForReceiverWithDiscovered: aSet) withDiscovered: aSet ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self typTypeForResultWithDiscovered: aSet
]
