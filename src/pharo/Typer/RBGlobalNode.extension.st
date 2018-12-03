Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeRecursive [
	| type clazz |
	(self binding isGlobalClassNameBinding or: [ self binding isGlobalVariable ])
		ifTrue: [ ^ self binding value class typAsType ].
	clazz := self methodNode methodClass.
	"need to ensure getClass can be called before checking pool"
	type := (self binding isClassVariable or: [ (self binding scope respondsTo: #getClass) and: [ self binding isFromSharedPool ] ])
		ifTrue: [ clazz instanceSide typAsType ]
		ifFalse: [ clazz typAsType ].
	^ TypVariableResolvers instance
		typeForVariable:
			(TypVariableLookup new
				receiverType: type;
				selector: name asSymbol;
				yourself)
]
