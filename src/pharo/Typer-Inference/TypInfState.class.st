Class {
	#name : #TypInfState,
	#superclass : #IdentityDictionary,
	#instVars : [
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfState class >> self: aType super: anotherType [

	^ self new
		  initializeSelf: aType super: anotherType;
		  yourself
]

{ #category : #comparing }
TypInfState >> = anObject [

	super = anObject ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ true
]

{ #category : #splitjoin }
TypInfState >> covariant: aState [

	| copy |
	self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ].
	copy := self copy.
	aState keysAndValuesDo: [ :n :t | 
		copy
			at: n
			put:
			(copy at: n ifPresent: [ :tt | t covariant: tt ] ifAbsent: [ t ]) ].
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
	diff := TypInfState self: selfType super: superType.
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

{ #category : #comparing }
TypInfState >> hash [

	^ (super hash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #initialization }
TypInfState >> initializeSelf: aType super: anotherType [

	selfType := aType.
	superType := anotherType
]

{ #category : #'as yet unclassified' }
TypInfState >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfState >> super [

	^ superType
]
