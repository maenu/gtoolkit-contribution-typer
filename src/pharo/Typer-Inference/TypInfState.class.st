Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'a1',
		'a2',
		't1',
		't2',
		'tally',
		'twoK',
		'twoKL',
		'random'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState >> associationsDo: aBlock [
	t1 do: [ :a | a ifNotNil: aBlock ].
	t2 do: [ :a | a ifNotNil: aBlock ]
]

{ #category : #accessing }
TypInfState >> at: aNode [
	^ self at: aNode ifAbsent: [ self error: 'not found' ]
]

{ #category : #accessing }
TypInfState >> at: aNode covariantPut: aType [
	self
		privateAssociationAt: aNode
		ifPresent: [ :a | 
			^ a
				at: 3
				put: ((a at: 3) ifNil: [ aType ] ifNotNil: [ :t | t covariant: aType ]) ]
		ifAbsentPut: [ {aNode.
				nil.
				aType} ].
	^ aType
]

{ #category : #accessing }
TypInfState >> at: aNode ifAbsent: aBlock [
	^ self
		at: aNode
		ifPresent: #yourself
		ifAbsent: aBlock
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock [
	^ self
		at: aNode
		ifPresent: aBlock
		ifAbsent: nil
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [
	| h x |
	x := aNode identityHash.
	h := x * a1 \\ twoK // twoKL + 1.
	(t1 at: h)
		ifNotNil: [ :aa | 
			(aa at: 1) == aNode
				ifTrue: [ ^ (aa at: 3)
						ifNil: anotherBlock
						ifNotNil: [ :t | aa at: 3 put: (aBlock value: t) ] ] ].
	h := x * a2 \\ twoK // twoKL + 1.
	(t2 at: h)
		ifNotNil: [ :aa | 
			(aa at: 1) == aNode
				ifTrue: [ ^ (aa at: 3)
						ifNil: anotherBlock
						ifNotNil: [ :t | aa at: 3 put: (aBlock value: t) ] ] ].
	^ anotherBlock value
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	self
		privateAssociationAt: aNode
		ifPresent: [ :a | ^ a at: 3 put: aType ]
		ifAbsentPut: [ {aNode.
				nil.
				aType} ].
	^ aType
]

{ #category : #accessing }
TypInfState >> changes [
	| result |
	result := IdentityDictionary new: tally.
	self
		associationsDo: [ :a | 
			| t |
			t := a at: 3.
			(a at: 2) == t ifFalse: [ result at: (a at: 1) put: t ].
			a at: 2 put: t ].
	^ result
]

{ #category : #accessing }
TypInfState >> growTo: anInteger [
	| oldT1 oldT2 |
	oldT1 := t1.
	oldT2 := t2.
	t1 := Array new: anInteger.
	t2 := Array new: anInteger.
	self randomize.
	1
		to: oldT1 size
		do: [ :i | 
			(oldT1 at: i)
				ifNotNil: [ :a | 
					self
						privateAssociationAt: (a at: 1)
						ifPresent: [ :aa | aa at: 3 put: (a at: 3)	"why does this happen?" ]
						ifAbsentPut: [ a ] ] ].
	1
		to: oldT2 size
		do: [ :i | 
			(oldT2 at: i)
				ifNotNil: [ :a | 
					self
						privateAssociationAt: (a at: 1)
						ifPresent: [ :aa | aa at: 3 put: (a at: 3)	"why does this happen?" ]
						ifAbsentPut: [ a ] ] ]
]

{ #category : #accessing }
TypInfState >> initialize [
	super initialize.
	t1 := Array new: 128.
	t2 := Array new: 128.
	tally := 0.
	random := Random new.
	self randomize
]

{ #category : #accessing }
TypInfState >> postCopy [
	| oldT1 oldT2 |
	super postCopy.
	oldT1 := t1.
	oldT2 := t2.
	t1 := Array new: oldT1 size.
	t2 := Array new: oldT2 size.
	1
		to: oldT1 size
		do: [ :i | (oldT1 at: i) ifNotNil: [ :a | t1 at: i put: a copy ] ].
	1
		to: oldT2 size
		do: [ :i | (oldT2 at: i) ifNotNil: [ :a | t2 at: i put: a copy ] ]
]

{ #category : #accessing }
TypInfState >> privateAssociationAt: aNode ifPresent: aBlock ifAbsentPut: anotherBlock [
	| x h n aCurrent |
	x := aNode identityHash.
	h := x * a1 \\ twoK // twoKL + 1.
	(t1 at: h) ifNotNil: [ :a | (a at: 1) == aNode ifTrue: [ ^ aBlock value: a ] ].
	h := x * a2 \\ twoK // twoKL + 1.
	(t2 at: h) ifNotNil: [ :a | (a at: 1) == aNode ifTrue: [ ^ aBlock value: a ] ].
	n := t1 size + t2 size.
	aCurrent := anotherBlock value.
	1
		to: n
		do: [ :i | 
			h := (aCurrent at: 1) identityHash * a1 \\ twoK // twoKL + 1.
			(t1 at: h)
				ifNil: [ t1 at: h put: aCurrent.
					tally := tally + 1.
					^ aCurrent at: 3 ]
				ifNotNil: [ :a | 
					t1 at: h put: aCurrent.
					aCurrent := a ].
			h := (aCurrent at: 1) identityHash * a2 \\ twoK // twoKL + 1.
			(t2 at: h)
				ifNil: [ t2 at: h put: aCurrent.
					tally := tally + 1.
					^ aCurrent at: 3 ]
				ifNotNil: [ :a | 
					t2 at: h put: aCurrent.
					aCurrent := a ] ].
	n - tally < (n // 2 max: 1)
		ifTrue: [ self growTo: n ]
		ifFalse: [ self growTo: n // 2 ].
	^ self
		privateAssociationAt: aNode
		ifPresent: aBlock
		ifAbsentPut: [ aCurrent ]
]

{ #category : #accessing }
TypInfState >> randomize [
	| k l |
	k := 32.	"#identityHash is 32bit"
	l := (t1 size log: 2) floor.
	twoK := 2 ** k.
	twoKL := 2 ** (k - l).
	[ a1 := (random nextInteger: twoK) - 1 ] doWhileTrue: [ a1 \\ 2 = 0 ].
	[ a2 := (random nextInteger: twoK) - 1 ] doWhileTrue: [ a2 \\ 2 = 0 ]
]

{ #category : #accessing }
TypInfState >> slurpAll: aCollection [
	| l |
	l := aCollection size.
	self associationsDo: [ :a | a at: 3 put: (Array new: l) ].
	aCollection
		withIndexDo: [ :s :i | 
			s
				associationsDo: [ :aOther | 
					| n |
					n := aOther at: 1.
					(aOther at: 3)
						ifNil: [ self
								privateAssociationAt: n
								ifPresent: [ :aSelf | aSelf ]
								ifAbsentPut: [ {n.
										nil.
										Array new: l} ] ]
						ifNotNil: [ :t | 
							self
								privateAssociationAt: n
								ifPresent: [ :aSelf | (aSelf at: 3) at: i put: t ]
								ifAbsentPut: [ {n.
										nil.
										(Array new: l)
											at: i put: t;
											yourself} ] ] ] ].
	self
		associationsDo: [ :a | 
			| s |
			s := a at: 3.
			a
				at: 3
				put: (s size = 0
						ifTrue: [ nil ]
						ifFalse: [ | current |
							s
								do: [ :t | 
									t
										ifNotNil: [ current := current ifNil: [ t ] ifNotNil: [ current covariant: t ] ] ].
							current ]) ]
]
