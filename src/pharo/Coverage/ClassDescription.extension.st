Extension { #name : #ClassDescription }

{ #category : #'*Coverage' }
ClassDescription >> covClassForVariableNamed: aString [
	^ (((((self withAllSuperclasses flatCollect: #methods) flatCollect: #instanceVariableWriteNodes) select: [ :e | e name = aString ]) collect: [ :e | CovCoverage installedNodeFor: e ifFound: #covClass ifNone: [ CovSummary new ] ]) inject: CovSummary new into: [ :a :b | a , b ])
		inferredClass
]
