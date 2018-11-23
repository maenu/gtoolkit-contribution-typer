Extension { #name : #RBCascadeNode }

{ #category : #'*Coverage' }
RBCascadeNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: (messages last covClassesWithDiscovered: aSet);
		yourself
]
