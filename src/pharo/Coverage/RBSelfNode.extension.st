Extension { #name : #RBSelfNode }

{ #category : #'*Coverage' }
RBSelfNode >> covClasses [
	^ CovSummary new
		increment: self methodNode method methodClass;
		yourself
]
