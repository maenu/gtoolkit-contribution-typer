Extension { #name : #ClassDescription }

{ #category : #'*Coverage' }
ClassDescription >> covClassesForVariableNamed: aString [
	^ ((((self withAllSuperclasses flatCollect: #methods) flatCollect: #instanceVariableWriteNodes) select: [ :e | e name = aString ]) collect: #covClasses) inject: CovSummary new into: [ :a :b | a , b ]
]
