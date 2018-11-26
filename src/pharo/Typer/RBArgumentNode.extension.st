Extension { #name : #RBArgumentNode }

{ #category : #'*Typer' }
RBArgumentNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ (self whoDefines: self name) typTypeForArgumentNamed: self name withDiscovered: aSet
]
