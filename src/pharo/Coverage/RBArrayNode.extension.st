Extension { #name : #RBArrayNode }

{ #category : #'*Coverage' }
RBArrayNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: Array;
		yourself
]
