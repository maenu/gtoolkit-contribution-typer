Class {
	#name : #TypInfState,
	#superclass : #IdentityDictionary,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState >> at: anObject [

	^ self at: anObject ifAbsentPut: TypUnknownType instance
]

{ #category : #splitjoin }
TypInfState >> covariant: aState [

	| copy |
	self flag: 'self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ]'.
	copy := aState copy.
	aState keysAndValuesDo: [ :n :t | 
		copy
			at: n
			put:
			(self at: n ifPresent: [ :tt | t covariant: tt ] ifAbsent: [ t ]) ].
	^ copy
]

{ #category : #accessing }
TypInfState >> covariant: aNode with: aType [

	^ self at: aNode put: ((self at: aNode) covariant: aType)
]

{ #category : #'as yet unclassified' }
TypInfState >> covariantFrom: aNode to: anotherNode with: aType [

	| type edge |
	aType isUnknown ifTrue: [ 
		^ self "generalizing to the bottom type is not a constraint" ].
	"tighten type"
	type := self covariant: anotherNode with: aType.
	"tighten node with tightened type"
	anotherNode tighten: type in: self.
	"ensure tighten edge"
	edge := aNode outgoing
		        at: #tighten
		        ifPresent: [ :s | 
			        s detect: [ :e | e target == anotherNode ] ifNone: [ 
				        aNode outgoingAdd:
					        (TypInfTightenEdge
						         origin: aNode
						         target: anotherNode
						         type: type) ] ]
		        ifAbsent: [ 
			        aNode outgoingAdd:
				        (TypInfTightenEdge
					         origin: aNode
					         target: anotherNode
					         type: type) ].
	"tighten edge"
	edge set: type in: self
]

{ #category : #accessing }
TypInfState >> diff: aState [

	| diff |
	diff := TypInfState new.
	self keys , aState keys do: [ :n | 
		| a b |
		a := self at: n ifAbsent: [ nil ].
		b := aState at: n ifAbsent: [ nil ].
		a = b ifFalse: [ 
			diff at: n put: { 
					a.
					b } ] ].
	^ diff
]
