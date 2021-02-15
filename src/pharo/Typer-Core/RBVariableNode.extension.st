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
	^ TypUnknownType new
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typHasDefiningType [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #'*Typer-Core' }
RBVariableNode >> typIsAssignedTo [
	^ self parent isAssignment
		and: [ (self parent "typCastAs RBAssignmentNode") variable == self ]
]
