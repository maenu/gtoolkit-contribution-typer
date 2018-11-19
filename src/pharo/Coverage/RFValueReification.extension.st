Extension { #name : #RFValueReification }

{ #category : #'*Coverage' }
RFValueReification class >> entities [
	self flag: 'adds literal node, might be merged into core, if it works, needs tests in reflexivity'.
	^{RBVariableNode. RBAssignmentNode. RBReturnNode. RBMessageNode . RBLiteralNode . LiteralVariable . Slot}
]

{ #category : #'*Coverage' }
RFValueReification >> genForRBLiteralArrayNode [
	self flag: 'adds literal node, might be merged into core, if it works, needs tests in reflexivity'.
	^ RBLiteralArrayNode value: entity value
]

{ #category : #'*Coverage' }
RFValueReification >> genForRBLiteralValueNode [
	self flag: 'adds literal node, might be merged into core, if it works, needs tests in reflexivity'.
	^ RBLiteralValueNode value: entity value
]
