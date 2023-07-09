Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfLocalDefinition >> initialize: aState [
	| className global |
	super initialize: aState.
	node isArgumentVariable ifFalse: [ ^ state at: self put: TypNilType instance ].
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ (node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ self ] ].
	global := Smalltalk globals at: className asSymbol ifAbsent: [ ^ self ].
	global isClassOrTrait ifFalse: [ ^ self ].
	state at: self put: global typAsType
]

{ #category : #accessing }
TypInfLocalDefinition >> outReads [

	^ out
		  at: #read
		  ifPresent: [ :e | e collect: #target ]
		  ifAbsent: [ #(  ) ]
]

{ #category : #accessing }
TypInfLocalDefinition >> type [

	^ (self outReads collect: #type) typAsType
]
