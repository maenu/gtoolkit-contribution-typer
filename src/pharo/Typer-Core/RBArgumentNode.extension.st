Extension { #name : #RBArgumentNode }

{ #category : #'*Typer-Core' }
RBArgumentNode >> typArguments [
	^ ((self whoDefines: self name) allChildren
		select: [ :e | 
			e isArgument
				and: [ e name = self name
						and:
							[ e parent isMessage and: [ e parent arguments anySatisfy: [ :f | f == e ] ] ] ] ]) "typCastAs SequenceableCollection<RBArgumentNode>"
]

{ #category : #'*Typer-Core' }
RBArgumentNode >> typAssigned [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e value isArgument and: [ e value name = self name ] ]
]

{ #category : #'*Typer-Core' }
RBArgumentNode >> typIsDeclaration [
	<typTypeResultAs: 'Boolean'>
	^ ((self parent "typCastAs RBProgramNode") isBlock or: [ (self parent "typCastAs RBProgramNode") isMethod ])
		and: [ (self parent "typCastAs {RBBlockNode,RBMethodNode}") arguments
				anySatisfy: [ :e | e == self ] ]
]

{ #category : #'*Typer-Core' }
RBArgumentNode >> typTypeRecursiveIn: aContext [
	^ self typIsDeclaration
		ifTrue: [ | type |
			type := (self parent "typCastAs {RBBlockNode,RBMethodNode}") typTypeForArgumentNamed: self name in: aContext.
			type isUnknown
				ifTrue: [ type := (self typArguments
						collect: [ :e | 
							| i |
							i := e parent arguments detectIndex: [ :f | f == e ].
							e parent typTypeForArgumentAt: i in: aContext ]) typAsType ].
			type isUnknown
				ifTrue: [ type := ((self typAssigned select: [ :e | e variable typHasDefiningClass ]) collect: [ :e | e variable typDefiningClass typTypeForVariable: e variable name asSymbol ]) typAsType ].
			type ]
		ifFalse:
			[ "if defining a temp with the name of an arg, definer will be an argument node"
			| definer |
			definer := (self whoDefines: self name) "typCastAs {RBBlockNode,RBMethodNode}".
			(definer isBlock or: [ definer isMethod ])
				ifTrue: [ (definer arguments detect: [ :e | e name = self name ]) typTypeIn: aContext ]
				ifFalse: [ TypUnknownType instance ] ]
]
