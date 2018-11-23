Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Coverage' }
RBLiteralArrayNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ CovSummary new
		increment: Array;
		yourself
]
