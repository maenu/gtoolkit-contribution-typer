Extension { #name : #RBTemporaryNode }

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typArguments [
	<typTypeResultAs: 'Collection<RBTemporaryNode>'>
	^ ((self whoDefines: self name) allChildren
		select: [ :e | 
			e isTemp
				and: [ e name = self name
						and: [ e parent isMessage and: [ (e parent "typCastAs RBMessageNode") arguments anySatisfy: [ :f | f == e] ] ] ] ]) "typParameters RBTemporaryNode"
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typAssigned [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e value isTemp and: [ e value name = self name ] ]
]

{ #category : #'*Typer-Core' }
RBTemporaryNode >> typAssignments [
	<typTypeResultAs: 'Collection<RBAssignmentNode>'>
	^ (self whoDefines: self name) assignmentNodes
		select: [ :e | e variable name = self name ]
]

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
			type := (self typAssignments collect: [ :e | e value typTypeIn: aContext ])
				typAsType.
			type isUnknown
				ifTrue: [ type := (self typArguments
						collect: [ :e | 
							| i |
							i := e parent arguments detectIndex: [ :f | f == e ].
							e parent typTypeForArgumentAt: i in: aContext ]) typAsType ].
					type isUnknown
						ifTrue: [ type := ((self typAssigned select: [ :e | e variable typHasDefiningClass ]) collect: [ :e | e variable typDefiningClass typTypeForVariable: e variable name asSymbol ]) typAsType ].
						type ]
		ifFalse: [ self typIsAssignmentVariable
				ifTrue: [ (self parent "typCastAs RBAssignmentNode") value typTypeIn: aContext ]
				ifFalse: [ TypExecutionOrderVisitor typeForTemporary: self ] ]
]
