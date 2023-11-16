Extension { #name : #Dictionary }

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath [
	^ self
		typAt: aPath
		ifPresent: #yourself
		ifAbsent: [ self errorKeyNotFound: aPath ]
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifAbsent: aBlock [
	^ self
		typAt: aPath
		ifPresent: #yourself
		ifAbsent: aBlock
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifAbsentPut: aBlock [
	^ self
		typAt: aPath
		ifPresent: #yourself
		ifAbsentPut: aBlock
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifPresent: aBlock [
	^ self
		typAt: aPath
		ifPresent: aBlock
		ifAbsent: [ nil ]
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifPresent: aBlock ifAbsent: anotherBlock [
	^ aBlock
		cull: (aPath inject: self into: [ :r :e | r at: e ifAbsent: [ ^ anotherBlock value ] ])
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifPresent: aBlock ifAbsentPut: anotherBlock [
	| current |
	self assert: [ aPath isNotEmpty ].
	current := self.
	aPath
		withIndexDo: [ :e :i | 
			i < aPath size
				ifTrue: [ current := current at: e ifAbsentPut: [ self species new ] ] ].
	^ current
		at: aPath last
		ifPresent: aBlock
		ifAbsentPut: anotherBlock
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath put: anObject [
	| current |
	self assert: [ aPath isNotEmpty ].
	current := self.
	aPath
		withIndexDo: [ :e :i | 
			i < aPath size
				ifTrue: [ current := current at: e ifAbsentPut: [ self species new ] ] ].
	^ current at: aPath last put: anObject
]

{ #category : #'*Typer-Core' }
Dictionary >> typFasterAt: anObject ifAbsentPut: aBlock [
	| index |
	index := self findElementOrNil: anObject.
	^ (array at: index)
		ifNil: [ | value |
			value := aBlock value.
			array at: index put: (Association key: anObject value: value).
			tally := tally + 1.
			value ]
		ifNotNil: #value
]

{ #category : #'*Typer-Core' }
Dictionary >> typRemoveAt: aPath [
	^ self
		typAt: (aPath copyFrom: 1 to: aPath size - 1)
		ifPresent: [ :e | e removeKey: aPath last ifAbsent: [  "noop" ] ]
		ifAbsent: [ nil ]
]
