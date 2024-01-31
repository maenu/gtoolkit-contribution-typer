Extension { #name : #Dictionary }

{ #category : #'*Typer-Inference' }
Dictionary >> typFastAt: aNode ifAbsentPut: anotherBlock [
	| index value |
	index := self findElementOrNil: aNode.
	(array at: index)
		ifNil: [ array at: index put: aNode -> (value := anotherBlock value).
			tally := tally + 1 ]
		ifNotNil: [ :a | value := a value ].
	^ value
]

{ #category : #'*Typer-Inference' }
Dictionary >> typFastAt: aNode ifPresent: aBlock ifAbsentPut: anotherBlock [
	| index value |
	index := self findElementOrNil: aNode.
	(array at: index)
		ifNil: [ array at: index put: aNode -> (value := anotherBlock value).
			tally := tally + 1 ]
		ifNotNil: [ :a | value := aBlock cull: a value ].
	^ value
]

{ #category : #'*Typer-Inference' }
Dictionary >> typFastAt: aNode ifPresentPut: aBlock ifAbsentPut: anotherBlock [
	| index value |
	index := self findElementOrNil: aNode.
	(array at: index)
		ifNil: [ array at: index put: aNode -> (value := anotherBlock value).
			tally := tally + 1 ]
		ifNotNil: [ :a | a value: (value := aBlock value: a value) ].
	^ value
]

{ #category : #'*Typer-Inference' }
Dictionary >> typFastWithCheckAt: aNode ifAbsentPut: anotherBlock [
	| index value |
	index := self findElementOrNil: aNode.
	(array at: index)
		ifNil: [ array at: index put: aNode -> (value := anotherBlock value).
			tally := tally + 1.
			self fullCheck ]
		ifNotNil: [ :a | value := a value ].
	^ value
]

{ #category : #'*Typer-Inference' }
Dictionary >> typFastWithCheckAt: aNode ifPresent: aBlock ifAbsentPut: anotherBlock [
	| index value |
	index := self findElementOrNil: aNode.
	(array at: index)
		ifNil: [ array at: index put: aNode -> (value := anotherBlock value).
			tally := tally + 1.
			self fullCheck ]
		ifNotNil: [ :a | value := aBlock cull: a value ].
	^ value
]

{ #category : #'*Typer-Inference' }
Dictionary >> typFastWithCheckAt: aNode ifPresentPut: aBlock ifAbsentPut: anotherBlock [
	| index value |
	index := self findElementOrNil: aNode.
	(array at: index)
		ifNil: [ array at: index put: aNode -> (value := anotherBlock value).
			tally := tally + 1.
			self fullCheck ]
		ifNotNil: [ :a | a value: (value := aBlock value: a value) ].
	^ value
]

{ #category : #'*Typer-Inference' }
Dictionary >> typInfType [
	| b a |
	b := OrderedCollection new.
	a := OrderedCollection new.
	self typInfTypes
		do: [ :e | 
			b add: (e at: #B).
			a add: (e at: #A) ].
	^ self class typAsType
		withParameters: {a ifEmpty: TypUnknownType instance ifNotEmpty: #typAsType.
				b ifEmpty: TypUnknownType instance ifNotEmpty: #typAsType}
]

{ #category : #'*Typer-Inference' }
Dictionary >> typInfTypes [

	self size < 128 ifTrue: [ 
		^ self associations collect: #typInfType as: Array ].
	^ 128 typTimesCollect: [ :i | self atRandom typInfType ]
]
