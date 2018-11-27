Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ (self whoDefines: name) typTypeForArgumentNamed: name withDiscovered: aDictionary ]
]
