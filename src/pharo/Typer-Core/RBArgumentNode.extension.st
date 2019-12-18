Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Core' }
RBArgumentNode >> typIsDeclaration [
	<typTypeResultAs: 'Boolean'>
	^ self parent isSequence
		and:
			[ (self parent "typCastAs RBSequenceNode") arguments anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBArgumentNode >> typTypeRecursive [
	^ ((self parent isBlock or: [ (self parent "typCastAs RBProgramNode") isMethod ])
		and: [ (self parent "typCastAs {RBBlockNode,RBMethodNode}") arguments
				anySatisfy: [ :e | e == self ] ])
		ifTrue:
			[ (self parent "typCastAs {RBBlockNode,RBMethodNode}") typTypeForArgumentNamed: self name ]
		ifFalse:
			[ "if defining a temp with the name of an arg, definer will be an argument node"
			| definer |
			definer := (self whoDefines: self name) "typCastAs {RBBlockNode,RBMethodNode}".
			(definer isBlock or: [ definer isMethod ])
				ifTrue:
					[ (definer arguments detect: [ :e | e name = self name ]) typType ]
				ifFalse: [ TypUnknownType instance ] ]
]
