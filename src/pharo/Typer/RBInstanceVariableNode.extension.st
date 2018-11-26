Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer' }
RBInstanceVariableNode >> typTypeWithDiscovered: aSet [
	| type |
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	type := self methodNode methodClass typAsType.
	^ TypVariableResolvers instance typeForVariable: type -> name
]
