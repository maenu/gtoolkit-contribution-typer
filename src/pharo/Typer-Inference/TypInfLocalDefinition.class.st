Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLocalDefinition >> outReads [

	^ out
		  at: #read
		  ifPresent: [ :e | e collect: #target ]
		  ifAbsent: [ #(  ) ]
]

{ #category : #initialization }
TypInfLocalDefinition >> transfer [
	| className global |
	node isArgumentVariable ifFalse: [ ^ state at: self put: TypNilType instance ].
	state at: self ifAbsent: [ ^ self ].
	(state at: self) isUnknown ifFalse: [ ^ self ].
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
TypInfLocalDefinition >> type [

	^ (self outReads collect: #type) typAsType
]
