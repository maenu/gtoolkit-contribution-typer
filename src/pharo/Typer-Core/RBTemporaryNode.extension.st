Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typTypeRecursive [
	self isDefinition
		ifTrue: [ | type |
			type := self typInfTypeAssignedTo.
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			^ type ].
	self typIsAssignedTo
		ifTrue: [ ^ self parent value typType ].
	^ TypExecutionOrderVisitor typeForTemporary: self
]
