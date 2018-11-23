Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForArgumentAt: anInteger [
	^ self covClassesForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForArgumentAt: anInteger withDiscovered: aSet [
	^ (self covMethodAsts collect: [ :e | e covClassesForArgumentAt: anInteger withDiscovered: aSet ]) inject: CovSummary new into: [ :a :b | a , b ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForReceiver [
	^ self covClassesForReceiverWithDiscovered: Set new
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForReceiverWithDiscovered: aSet [
	^ receiver covClassesWithDiscovered: aSet
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForResult [
	^ self covClassesForResultWithDiscovered: Set new
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForResultWithDiscovered: aSet [
	^ (self covMethodAsts collect: [ :e | e covClassesForResultForReceivers: (self covClassesForReceiverWithDiscovered: aSet) withDiscovered: aSet ]) inject: CovSummary new into: [ :a :b | a , b ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ CovSummary new ].
	aSet add: self.
	^ self covClassesForResultWithDiscovered: aSet
]

{ #category : #'*Coverage' }
RBMessageNode >> covMethodAsts [
	| asts |
	asts := Set new.
	((self covClassesForReceiver collect: [ :e | (e key lookupSelector: selector) -> e value ]) select: [ :e | e key isNotNil ]) do: [ :e | CovCoverage installedAstFor: e key ifFound: [ :f | asts add: f ] ifNone: [  ] ].
	^ asts
]
