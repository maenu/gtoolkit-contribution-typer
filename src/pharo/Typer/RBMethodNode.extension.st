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
RBMethodNode >> typTypeForArgumentNamed: aSymbol [
	^ self method typTypeForArgumentNamed: aSymbol
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	^ self method typTypeForArgumentNamed: aSymbol withDiscovered: aSet
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
