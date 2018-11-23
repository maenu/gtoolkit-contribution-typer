Extension { #name : #RBSuperNode }

{ #category : #'*Coverage' }
RBSuperNode >> covClasses [
	^ CovSummary new
		increment: self methodNode method methodClass superclass;
		yourself
]
