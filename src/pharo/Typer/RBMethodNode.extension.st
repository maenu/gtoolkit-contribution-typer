Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArgumentAt: anInteger [
	^ self method typTypesForArgumentAt: anInteger
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ self method typTypesForArgumentAt: anInteger withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArgumentNamed: aString [
	^ self method typTypesForArgumentNamed: aString
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForArgumentNamed: aString withDiscovered: aSet [
	^ self method typTypesForArgumentNamed: aString withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForResult [
	^ self method typTypesForResult
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForResultForReceivers: aTypes [
	^ self method typTypesForResultForReceivers: aTypes
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForResultForReceivers: aTypes withDiscovered: aSet [
	^ self method typTypesForResultForReceivers: aTypes withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypesForResultWithDiscovered: aSet [
	^ self method typTypesForResultWithDiscovered: aSet
]
