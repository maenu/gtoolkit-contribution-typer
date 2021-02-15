Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Core' }
RBArgumentNode >> typTypeRecursive [
	^ self isDefinition
		ifTrue: [ | type |
			type := self parent typInfTypeForArgumentNamed: name.	"typCastAs {RBBlockNode,RBMethodNode}"
			type isUnknown
				ifTrue: [ type := self typInfTypeArguments ].
			type isUnknown
				ifTrue: [ type := self typInfTypeAssigned ].
			type ]
		ifFalse: [ ((self whoDefines: name) arguments detect: [ :e | e = self ])
				typType	"typCastAs {RBBlockNode,RBMethodNode}" ]
]
