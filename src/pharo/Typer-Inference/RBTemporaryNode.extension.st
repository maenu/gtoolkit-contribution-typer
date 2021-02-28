Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Inference' }
RBTemporaryNode >> typInfTypeRecursive [
	self isDefinition
		ifTrue: [ | type |
			self flag: 'FIXME those should be in a resolver as strategies'.
			type := self typInfTypeAssignedTo.
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			^ type ].
	self typInfIsAssignedTo
		ifTrue: [ ^ self parent value typInfType ].
	^ TypExecutionOrderVisitor typeForTemporary: self
]
