Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger [
	^ self method typTypeForArgumentAt: anInteger
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ self method typTypeForArgumentAt: anInteger withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aString [
	^ self method typTypeForArgumentNamed: aString
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aString withDiscovered: aSet [
	^ self method typTypeForArgumentNamed: aString withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResult [
	^ self method typTypeForResult
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultForReceiver: aType withDiscovered: aSet [
	^ self method typTypeForResultForReceiver: aType withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultForReceivers: aType [
	^ self method typTypeForResultForReceivers: aType
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultWithDiscovered: aSet [
	^ self method typTypeForResultWithDiscovered: aSet
]
