Extension { #name : #RBArrayNode }

{ #category : #'*Coverage' }
RBArrayNode >> covClasses [
	^ CovSummary new
		increment: Array;
		yourself
]
