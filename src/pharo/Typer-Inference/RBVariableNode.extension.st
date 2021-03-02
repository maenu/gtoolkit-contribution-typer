Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfArgumentUse [
	^ (((self whoDefines: name) allChildren
		select: [ :e | 
			e = self
				and: [ e parent isMessage and: [ e parent arguments includes: e ] ] ])
		collect: [ :e | 
			| i |
			i := e parent arguments indexOf: e.
			e parent typInfMethod arguments at: i ]) typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfAssigned [
	^ (((self whoDefines: name) assignmentNodes
		select: [ :e | e value = self and: [ e variable typInfHasDefiner ] ])
		collect:
			[ :e | e variable typInfDefiner lookupVariable: e variable name asSymbol ])
		typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfAssignedTo [
	^ (((self whoDefines: name) assignmentNodes
		select: [ :e | e variable = self ])
		collect: [ :e | e value typInfType ]) typAsType
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfDefiner [
	<typTypeResultAs: 'Type'>
	self assert: [ self typInfHasDefiner ].
	^ TypUnknownType new
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfHasDefiner [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfIsAssignedTo [
	^ self parent isAssignment
		and: [ (self parent "typCastAs RBAssignmentNode") variable == self ]
]
