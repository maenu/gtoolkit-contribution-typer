Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typMethod [
	^ self typMethodWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typMethodWithDiscovered: aSet [
	^ (self typTypeForReceiverWithDiscovered: aSet) lookupMethod: selector
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger [
	^ self typTypeForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ [ (self typMethodWithDiscovered: aSet) typTypeForArgumentAt: anInteger withDiscovered: aSet ]
		on: TypNoMethodFoundError
		do: [ TypUnknownType instance ]
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
	^ [ (self typMethodWithDiscovered: aSet) typTypeForResultForReceiver: (self typTypeForReceiverWithDiscovered: aSet) withDiscovered: aSet ]
		on: TypNoMethodFoundError
		do: [ TypUnknownType instance ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ self typTypeForResultWithDiscovered: aSet
]
