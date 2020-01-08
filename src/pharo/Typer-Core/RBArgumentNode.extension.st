Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Core' }
RBArgumentNode >> typIsDeclaration [
	^ (self parent isBlock or: [ self parent isMethod ])
		and: [ (self parent "typCastAs {RBBlockNode,RBMethodNode}") arguments
				anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBArgumentNode >> typTypeRecursiveIn: aContext [
	^ self typIsDeclaration
		ifTrue: [ | type |
			type := (self parent "typCastAs {RBBlockNode,RBMethodNode}") typTypeForArgumentNamed: name in: aContext.
			type isUnknown
				ifTrue: [ type := self typInfTypeArgumentsIn: aContext ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssignedIn: aContext ].
			type ]
		ifFalse:
			[ (((self whoDefines: name) "typCastAs {RBBlockNode,RBMethodNode}") arguments detect: [ :e | e = self ]) typTypeIn: aContext ]
]
