Extension { #name : #RBSequenceNode }

{ #category : #'*Typer' }
RBSequenceNode >> typType [
	<typTypeResultAs: 'TypType'>
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeRecursiveWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	| values |
	values := statements select: #isValue.
	values ifEmpty: [ ^ TypNilType instance ].
	^ values last typTypeWithDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBSequenceNode >> typTypeWithDiscovered: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<RBProgramNode,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ aDictionary
		at: self
		ifAbsentPut: [ aDictionary at: self put: TypUnknownType instance.
			self typTypeRecursiveWithDiscovered: aDictionary ]
]
