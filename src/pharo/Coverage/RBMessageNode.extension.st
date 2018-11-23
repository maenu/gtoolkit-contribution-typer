Extension { #name : #RBMessageNode }

{ #category : #'*Coverage' }
RBMessageNode >> covClasses [
	^ self covClassesForResult
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForArgumentAt: anInteger [
	^ (self covMethodAsts collect: [ :e | e covClassesForArgumentAt: anInteger ]) inject: CovSummary new into: [ :a :b | a , b ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForReceiver [
	^ receiver covClasses
]

{ #category : #'*Coverage' }
RBMessageNode >> covClassesForResult [
	^ (self covMethodAsts collect: [ :e | e covClassesForResultForReceivers: self covClassesForReceiver ]) inject: CovSummary new into: [ :a :b | a , b ]
]

{ #category : #'*Coverage' }
RBMessageNode >> covMethodAsts [
	| asts |
	asts := Set new.
	((self covClassesForReceiver collect: [ :e | (e key lookupSelector: selector) -> e value ]) select: [ :e | e key isNotNil ]) do: [ :e | CovCoverage installedAstFor: e key ifFound: [ :f | asts add: f ] ifNone: [  ] ].
	^ asts
]
