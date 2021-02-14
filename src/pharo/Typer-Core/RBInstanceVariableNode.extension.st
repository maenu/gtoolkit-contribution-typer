Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningType ].
	self flag: 'FIXME where to lookup self?'.
	^ nil
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typHasDefiningType [
	^ true
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typTypeRecursive [
	^ self typIsAssignedTo
		ifTrue: [ self parent value typType	"typCastAs RBAssignmentNode" ]
		ifFalse: [ TypVariableLookupIndex instance
				typeFor:
					(TypVariableLookup new
						receiverType: self typDefiningType;
						selector: name asSymbol;
						yourself) ]
]
