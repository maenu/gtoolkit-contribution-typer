Extension { #name : #RBThisContextNode }

{ #category : #'*Coverage' }
RBThisContextNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: Context;
		yourself
]
