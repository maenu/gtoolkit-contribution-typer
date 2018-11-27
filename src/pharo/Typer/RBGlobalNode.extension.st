Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeRecursiveWithDiscovered: aDictionary [
	| type clazz |
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	clazz := self methodNode methodClass.
	type := (self binding isFromSharedPool or: [ self binding isClassVariable ])
		ifTrue: [ clazz instanceSide typAsType ]
		ifFalse: [ clazz typAsType ].
	TypVariableResolvers instance typeForVariable: type -> name
]
