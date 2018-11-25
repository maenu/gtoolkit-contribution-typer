Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typMethodTypes [
	^ self typMethodTypesWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typMethodTypesWithDiscovered: aSet [
	^ ((self typTypesForReceiverWithDiscovered: aSet) collect: [ :e | (e key lookupMethodSelector: selector) -> e value ]) select: [ :e | e key isNotNil ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForArgumentAt: anInteger [
	^ self typTypesForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ ((self typMethodTypesWithDiscovered: aSet) summary orderedKeys collect: [ :e | e typTypesForArgumentAt: anInteger withDiscovered: aSet ])
		inject: TypTypes new
		into: [ :a :b | a , b ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForReceiver [
	^ self typTypesForReceiverWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForReceiverWithDiscovered: aSet [
	^ receiver typTypesWithDiscovered: aSet
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForResult [
	^ self typTypesForResultWithDiscovered: Set new
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesForResultWithDiscovered: aSet [
	^ ((self typMethodTypesWithDiscovered: aSet) summary orderedKeys
		collect: [ :e | e typTypesForResultForReceivers: (self typTypesForReceiverWithDiscovered: aSet) withDiscovered: aSet ])
		inject: TypTypes new
		into: [ :a :b | a , b ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ self typTypesForResultWithDiscovered: aSet
]
