Class {
	#name : #TypInfVariable,
	#superclass : #TypInfNode,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfVariable >> initialize: aState [

	| className global |
	super initialize: aState.
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ 
			(node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ self ] ].
	global := Smalltalk globals
		          at: className asSymbol
		          ifAbsent: [ ^ self ].
	global isClassOrTrait ifFalse: [ ^ self ].
	state at: self put: global typAsType
]

{ #category : #initialization }
TypInfVariable >> set: aType in: aState [

	aState at: self put: aType
]
