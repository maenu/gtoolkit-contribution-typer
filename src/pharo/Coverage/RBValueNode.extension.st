Extension { #name : #RBValueNode }

{ #category : #'*Coverage' }
RBValueNode >> covClass [
	^ self covClasses inferredClass
]

{ #category : #'*Coverage' }
RBValueNode >> covClasses [
	^ CovSummary new
		increment: Object;
		yourself
]
