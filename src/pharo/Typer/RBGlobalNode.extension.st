Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeRecursiveWithDiscovered: aDictionary [
	| type clazz |
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	clazz := self methodNode methodClass.
	"need to ensure getClass can be called before checking pool"
	type := (self binding isClassVariable or: [ (self binding scope respondsTo: #getClass) and: [ self binding isFromSharedPool ] ])
		ifTrue: [ clazz instanceSide typAsType ]
		ifFalse: [ clazz typAsType ].
	^ TypVariableResolvers instance typeForVariable: type -> name
]
