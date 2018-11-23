Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Coverage' }
RBLiteralArrayNode >> covClasses [
	^ CovSummary new
		increment: Array;
		yourself
]
