Extension { #name : #RBThisContextNode }

{ #category : #'*Coverage' }
RBThisContextNode >> covClasses [
	^ CovSummary new
		increment: Context;
		yourself
]
