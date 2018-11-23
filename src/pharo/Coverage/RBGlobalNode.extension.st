Extension { #name : #RBGlobalNode }

{ #category : #'*Coverage' }
RBGlobalNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: self binding value class;
		yourself
]
