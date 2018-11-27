Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typType [
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursiveWithDiscovered: aDictionary [
	| values |
	values := statements select: #isValue.
	values ifEmpty: [ ^ TypNilType instance ].
	^ values last typTypeWithDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ aDictionary at: self put: TypUnknownType instance.
			self typTypeRecursiveWithDiscovered: aDictionary ]
]
