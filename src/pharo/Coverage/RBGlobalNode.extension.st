Extension { #name : #RBGlobalNode }

{ #category : #'*Coverage' }
RBGlobalNode >> covClasses [
	^ CovSummary new
		increment: self binding value class;
		yourself
]
