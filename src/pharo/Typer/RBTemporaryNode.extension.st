Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary at: self ifAbsentPut: [ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = name ] ]) collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType ]
]
