Extension { #name : #RBMessageNode }

{ #category : #'*Typer' }
RBMessageNode >> typKnownArgumentTypesWithDiscovered: aDictionary [
	^ arguments collect: [ :f | f typTypeWithDiscovered: aDictionary ]
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	| receiverType |
	receiverType := self typTypeForReceiverWithDiscovered: aDictionary.
	^ TypMethodResolvers instance typeForArgumentAt: anInteger ofMethod: receiverType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary))
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForReceiverWithDiscovered: aDictionary [
	^ receiver typTypeWithDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeForResultWithDiscovered: aDictionary [
	| receiverType |
	receiverType := self typTypeForReceiverWithDiscovered: aDictionary.
	^ TypMethodResolvers instance typeForResultOfMethod: receiverType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary))
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ self typTypeForResultWithDiscovered: aDictionary ]
]
