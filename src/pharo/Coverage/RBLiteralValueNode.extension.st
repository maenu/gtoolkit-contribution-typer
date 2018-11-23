Extension { #name : #RBLiteralValueNode }

{ #category : #'*Coverage' }
RBLiteralValueNode >> covClasses [
	^ CovSummary new
		increment: value class;
		yourself
]
