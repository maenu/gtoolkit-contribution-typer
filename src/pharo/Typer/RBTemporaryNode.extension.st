Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer' }
RBTemporaryNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]) collect: [ :e | e typTypeWithDiscovered: aSet ]) typAsCompatibleType
]
