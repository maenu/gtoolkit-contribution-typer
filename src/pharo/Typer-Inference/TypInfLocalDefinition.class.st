Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfLocalDefinition >> initialize: aState [

	| type className global |
	state := aState.
	node isArgumentVariable ifFalse: [ 
		^ state at: self put: TypNilType instance ].
	type := state at: self put: TypUnknownType instance.
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ 
			(node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ type ] ].
	global := Smalltalk globals
		          at: className asSymbol
		          ifAbsent: [ ^ type ].
	global isClassOrTrait ifFalse: [ ^ type ].
	^ state at: self put: global typAsType
]

{ #category : #accessing }
TypInfLocalDefinition >> outgoingReads [

	^ outgoing
		  at: #read
		  ifPresent: [ :e | e collect: #target ]
		  ifAbsent: [ #(  ) ]
]

{ #category : #accessing }
TypInfLocalDefinition >> type [

	^ (self outgoingReads collect: #type) typAsType
]
