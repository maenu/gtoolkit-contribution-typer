Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeWithDiscovered: aSet [
	| type |
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	type := self binding isClassVariable
		ifTrue: [ self methodNode methodClass instanceSide typAsType ]
		ifFalse: [ self binding isGlobalClassNameBinding
				ifTrue: [ self binding value class typAsType ]
				ifFalse: [ self methodNode methodClass instanceSide typAsType ] ].
	^ TypVariableResolvers instance typeForVariable: type -> name withDiscovered: aSet
]
