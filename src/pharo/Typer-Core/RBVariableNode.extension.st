Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefinedType [
	^ TypVariableLookupIndex instance
		typeFor:
			(TypVariableLookup new
				receiverType: self typDefiningType;
				selector: name asSymbol;
				yourself)
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningType ].
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typInfTypeArguments [
	^ (((self whoDefines: name) allChildren
		select: [ :e | 
			e = self
				and: [ e parent isMessage and: [ e parent arguments includes: e ] ] ])
		collect: [ :e | 
			| i |
			i := e parent arguments indexOf: e.
			e parent typTypeForArgumentAt: i ]) typAsType
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typInfTypeAssigned [
	^ (((self whoDefines: name) assignmentNodes
		select: [ :e | e value = self and: [ e variable typHasDefiningType ] ])
		collect: [ :e | e variable typDefinedType ]) typAsType
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typInfTypeAssignedTo [
	^ (((self whoDefines: self name) assignmentNodes
		select: [ :e | e variable = self ])
		collect: [ :e | e value typType ]) typAsType
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typIsAssignedTo [
	^ self parent isAssignment
		and: [ (self parent "typCastAs RBAssignmentNode") variable == self ]
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typIsDeclaration [
	<typTypeResultAs: 'Boolean'>
	^ false
]
