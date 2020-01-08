Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typIsDeclaration [
	<typTypeResultAs: 'Boolean'>
	^ self parent isSequence
		and:
			[ (self parent "typCastAs RBSequenceNode") temporaries anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typTypeRecursiveIn: aContext [
	^ self typIsDeclaration
		ifTrue: [ | type |
			type := self typInfTypeAssignedToIn: aContext.
			type isUnknown
				ifTrue: [ type := self typInfTypeArgumentsIn: aContext ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssignedIn: aContext ].
			type ]
		ifFalse: [ self typIsAssignedTo
				ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typTypeIn: aContext ]
				ifFalse: [ TypExecutionOrderVisitor typeForTemporary: self ] ]
]
