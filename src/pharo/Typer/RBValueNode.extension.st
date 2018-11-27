Extension { #name : #RBValueNode }

{ #category : #'*Typer' }
RBValueNode >> typType [
	^ self typTypeWithDiscovered: Dictionary new
]

{ #category : #'*Typer' }
RBValueNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ Object typAsType ]
]
