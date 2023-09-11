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
	node isArgumentVariable ifFalse: [ ^ self put: TypNilType instance ].
	state at: self ifAbsent: [ ^ self put: TypUnknownType instance ].
	(state at: self) isUnknown ifFalse: [ ^ self put: TypUnknownType instance ].
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ (node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ self put: TypUnknownType instance ] ].
	global := Smalltalk globals
			at: className asSymbol
			ifAbsent: [ ^ self put: TypUnknownType instance ].
	global isClassOrTrait ifFalse: [ ^ self put: TypUnknownType instance ].
	self put: global typAsType
]

{ #category : #accessing }
TypInfLocalDefinition >> type [
	^ type ifNil: [ (self outReads collect: #type) typAsMinimizedType ]
]
