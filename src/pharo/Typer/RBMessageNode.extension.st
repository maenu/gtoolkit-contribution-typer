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
	| receiverType resultType parameters |
	receiverType := self typTypeForReceiverWithDiscovered: aDictionary.
	resultType := TypMethodResolvers instance typeForResultOfMethod: receiverType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary)).
	parameters := self typParseCommentParameters.
	parameters ifNotEmpty: [ resultType := resultType asParametricType: parameters ].
	^ resultType
]

{ #category : #'*Typer' }
RBMessageNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ self typTypeForResultWithDiscovered: aDictionary
]
