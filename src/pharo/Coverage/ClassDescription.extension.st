Extension { #name : #ClassDescription }

{ #category : #'*Coverage' }
ClassDescription >> covClassForVariableNamed: aString [
	^ (((((self withAllSuperclasses flatCollect: #methods) flatCollect: #instanceVariableWriteNodes) select: [ :e | e name = aString ]) collect: [ :e | CovCoverage installedNodeFor: e parent ifFound: #covAssigns ifNone: [ CovSummary new ] ])
		inject: CovSummary new
		into: [ :a :b | a , b ]) inferredClass
]
