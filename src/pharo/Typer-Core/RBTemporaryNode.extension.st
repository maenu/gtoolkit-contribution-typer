Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typIsDeclaration [
	<typTypeResultAs: 'Boolean'>
	^ self parent isSequence
		and:
			[ (self parent "typCastAs RBSequenceNode") temporaries anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typTypeRecursive [
	^ self typIsDeclaration
		ifTrue: [ | type |
			type := self typInfTypeAssignedTo.
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			type ]
		ifFalse: [ self typIsAssignedTo
				ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typType ]
				ifFalse: [ TypExecutionOrderVisitor typeForTemporary: self ] ]
]
