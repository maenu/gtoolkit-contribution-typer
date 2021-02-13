Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Core' }
RBArgumentNode >> typIsDeclaration [
	^ (self parent isBlock or: [ self parent isMethod ])
		and: [ (self parent "typCastAs {RBBlockNode,RBMethodNode}") arguments
				anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBArgumentNode >> typTypeRecursive [
	^ self typIsDeclaration
		ifTrue: [ | type |
			type := self parent typTypeForArgumentNamed: name.	"typCastAs {RBBlockNode,RBMethodNode}"
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			type ]
		ifFalse: [ ((self whoDefines: name) arguments detect: [ :e | e = self ])
				typType	"typCastAs {RBBlockNode,RBMethodNode}" ]
]
