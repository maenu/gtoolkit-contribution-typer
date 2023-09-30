Extension { #name : #Dictionary }

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath [
	^ aPath inject: self into: [ :r :e | r at: e ifAbsent: [ ^ #() ] ]
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
		ifAbsent: [  "noop" ]
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifPresent: aBlock ifAbsent: anotherBlock [
	^ aBlock
		cull: (aPath inject: self into: [ :r :e | r at: e ifAbsent: [ ^ anotherBlock value ] ])
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath ifPresent: aBlock ifAbsentPut: anotherBlock [
	self assert: [ aPath isNotEmpty ].
	^ (aPath size > 1
		ifTrue: [ self
				typAt: (aPath copyFrom: 1 to: aPath size - 1)
				ifAbsentPut: [ self species new ] ]
		ifFalse: [ self ])
		at: aPath last
		ifPresent: aBlock
		ifAbsentPut: anotherBlock
]

{ #category : #'*Typer-Core' }
Dictionary >> typAt: aPath put: anObject [
	self assert: [ aPath isNotEmpty ].
	^ (aPath size > 1
		ifTrue: [ self
				typAt: (aPath copyFrom: 1 to: aPath size - 1)
				ifAbsentPut: [ self species new ] ]
		ifFalse: [ self ]) at: aPath last put: anObject
]

{ #category : #'*Typer-Core' }
Dictionary >> typRemoveAt: aPath [
	^ self
		typAt: (aPath copyFrom: 1 to: aPath size - 1)
		ifPresent: [ :e | e removeKey: aPath last ]
		ifAbsent: [ nil ]
]
