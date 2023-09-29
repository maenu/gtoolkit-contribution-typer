Extension { #name : #InstanceVariableSlot }

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtShaCanTypeIn: aContext [
	^ true
]

{ #category : #'*Typer-GToolkit' }
InstanceVariableSlot >> typGtShaMethodIn: aNode [
	self assert: [ self typGtShaCanTypeIn: aNode ].
	^ owningClass typGtShaVariable: name asSymbol type: aNode type
]
