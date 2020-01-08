Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typDefiningTypeIn: aContext [
	<typTypeResultAs: 'Type'>
	self assert: [ self typHasDefiningTypeIn: aContext ].
	^ aContext selfType
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typHasDefiningTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-Core' }
RBInstanceVariableNode >> typTypeRecursiveIn: aContext [
	^ self typIsAssignedTo
		ifTrue:
			[ self parent value typTypeIn: aContext	"typCastAs RBAssignmentNode" ]
		ifFalse: [ TypVariableLookupIndex instance
				typeFor:
					(TypVariableLookup new
						receiverType: (self typDefiningTypeIn: aContext);
						selector: self name asSymbol;
						yourself) ]
]
