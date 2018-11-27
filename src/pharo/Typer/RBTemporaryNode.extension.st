Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = name ] ]) collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType
]
