Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Inference' }
RBTemporaryNode >> typInfTypeRecursive [
	self isDefinition
		ifTrue: [ | type |
			self flag: 'FIXME those should be in a resolver as strategies'.
			type := self typInfAssignedTo.
			type isUnknown
				ifTrue: [ type := self typInfArgumentUse ].
			type isUnknown
				ifTrue: [ type := self typInfAssigned ].
			^ type ].
	self typInfIsAssignedTo
		ifTrue: [ ^ self parent value typInfType ].
	^ TypInfTemporaryExecutionOrderVisitor typeForTemporary: self
]
