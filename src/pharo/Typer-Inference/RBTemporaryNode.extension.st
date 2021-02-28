Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Inference' }
RBTemporaryNode >> typInfTypeRecursive [
	self isDefinition
		ifTrue: [ | type |
			self flag: 'FIXME should either not be here, or inf sends should be moved here'.
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
