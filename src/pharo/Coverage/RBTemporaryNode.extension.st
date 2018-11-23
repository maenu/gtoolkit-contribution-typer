Extension { #name : #RBTemporaryNode }

{ #category : #'*Coverage' }
RBTemporaryNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ (((self whoDefines: self name) assignmentNodes select: [ :e | e variable isTemp and: [ e variable name = self name ] ]) collect: [ :e | e covClassesWithDiscovered: aSet ]) inject: CovSummary new into: [ :a :b | a , b ]
]
