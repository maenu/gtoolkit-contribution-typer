Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typType [
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ | values |
			values := statements select: #isValue.
			values ifEmpty: [ ^ TypNilType instance ].
			values last typTypeWithDiscovered: aDictionary ]
]
