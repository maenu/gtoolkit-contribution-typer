Extension { #name : #RBSelfNode }

{ #category : #'*Coverage' }
RBSelfNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: self methodNode method methodClass;
		yourself
]
