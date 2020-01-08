Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefinedType [
	^ self typDefinedTypeIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefinedTypeIn: aContext [
	^ TypVariableLookupIndex instance
		typeFor:
			(TypVariableLookup new
				receiverType: (self typDefiningTypeIn: aContext);
				selector: name asSymbol;
				yourself)
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefiningType [
	^ self typDefiningTypeIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typDefiningTypeIn: aContext [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningTypeIn: aContext ].
	^ TypUnknownType instance
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningType [
	^ self typHasDefiningTypeIn: self methodNode typContext
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningTypeIn: aContext [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typInfTypeArgumentsIn: aContext [
	^ (((self whoDefines: name) allChildren
		select: [ :e | 
			e = self
				and: [ e parent isMessage and: [ e parent arguments includes: e ] ] ])
		collect: [ :e | 
			| i |
			i := e parent arguments indexOf: e.
			e parent typTypeForArgumentAt: i in: aContext ]) typAsType
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typInfTypeAssignedIn: aContext [
	^ (((self whoDefines: name) assignmentNodes
		select: [ :e | e value = self ])
		collect: [ :e | e variable typDefinedTypeIn: aContext ]) typAsType
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typInfTypeAssignedToIn: aContext [
	^ (((self whoDefines: self name) assignmentNodes
		select: [ :e | e variable = self ])
		collect: [ :e | e value typTypeIn: aContext ]) typAsType
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
