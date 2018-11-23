Extension { #name : #RBArgumentNode }

{ #category : #'*Coverage' }
RBArgumentNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ (self whoDefines: self name) covClassesForArgumentNamed: self name withDiscovered: aSet
]
