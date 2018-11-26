Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = name ] ]) collect: [ :e | e typTypeWithDiscovered: aSet ]) typAsUnionType
]
