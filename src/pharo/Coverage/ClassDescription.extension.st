Extension { #name : #ClassDescription }

{ #category : #'*Coverage' }
ClassDescription >> covClassesForVariableNamed: aString [
	^ self covClassesForVariableNamed: aString withDiscovered: Set new
]

{ #category : #'*Coverage' }
ClassDescription >> covClassesForVariableNamed: aString withDiscovered: aSet [
	"break recursion when known nodes are visited"

	^ (((((self withAllSuperclasses flatCollect: #methods) flatCollect: #instanceVariableWriteNodes) select: [ :e | e name = aString ]) collect: #parent)
		collect: [ :e | 
			(aSet includes: e)
				ifTrue: [ CovSummary new ]
				ifFalse: [ e covClassesWithDiscovered: aSet ] ]) inject: CovSummary new into: [ :a :b | a , b ]
]
