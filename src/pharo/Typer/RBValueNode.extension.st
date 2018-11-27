Extension { #name : #RBValueNode }

{ #category : #'*Typer' }
RBValueNode >> typType [
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBValueNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ Object typAsType
]

{ #category : #'*Typer' }
RBValueNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ aDictionary at: self put: TypUnknownType instance.
			self typTypeRecursiveWithDiscovered: aDictionary ]
]
