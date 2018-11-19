Extension { #name : #RFValueReification }

{ #category : #'*Coverage' }
RFValueReification class >> entities [
	^{RBVariableNode. RBAssignmentNode. RBReturnNode. RBMessageNode . RBLiteralNode . LiteralVariable . Slot}
]

{ #category : #'*Coverage' }
RFValueReification >> genForRBLiteralArrayNode [
	^ RBLiteralArrayNode value: entity value
]

{ #category : #'*Coverage' }
RFValueReification >> genForRBLiteralValueNode [
	^ RBLiteralValueNode value: entity value
]
