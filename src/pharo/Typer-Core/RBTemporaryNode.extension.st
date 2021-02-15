Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typTypeRecursive [
	^ self isDefinition
		ifTrue: [ | type |
			type := self typInfTypeAssignedTo.
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			type ]
		ifFalse: [ self typIsAssignedTo
				ifTrue: [ self parent value typType	"typCastAs RBAssignmentNode" ]
				ifFalse: [ TypExecutionOrderVisitor typeForTemporary: self ] ]
]
