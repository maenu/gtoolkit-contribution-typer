Extension { #name : #OrderedDictionary }

{ #category : #'*Typer-Core' }
OrderedDictionary >> typAt: aPath ifAbsent: aBlock [
	^ self
		typAt: aPath
		ifPresent: #yourself
		ifAbsent: aBlock
]

{ #category : #'*Typer-Core' }
OrderedDictionary >> typAt: aPath ifPresent: aBlock [
	^ self
		typAt: aPath
		ifPresent: aBlock
		ifAbsent: [ nil ]
]

{ #category : #'*Typer-Core' }
OrderedDictionary >> typAt: aPath ifPresent: aBlock ifAbsent: anotherBlock [
	^ aBlock
		cull: (aPath inject: self into: [ :r :e | r at: e ifAbsent: [ ^ anotherBlock value ] ])
]

{ #category : #'*Typer-Core' }
OrderedDictionary >> typLeafs [
	| result |
	result := OrderedCollection new.
	self typLeafsDo: [ :e | result add: e ].
	^ result
]

{ #category : #'*Typer-Core' }
OrderedDictionary >> typLeafsDo: aBlock [
	^ self
		associationsDo: [ :a | 
			a value isDictionary
				ifTrue: [ a value typLeafsDo: aBlock ]
				ifFalse: [ a value isCollection
						ifTrue: [ a value do: aBlock ]
						ifFalse: [ aBlock value: a value ] ] ]
]
