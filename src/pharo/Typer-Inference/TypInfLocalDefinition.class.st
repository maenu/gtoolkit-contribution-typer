Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfLocalDefinition >> ifFromName: aBlock [
	| className global |
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ (node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ self ] ].
	global := Smalltalk globals at: className asSymbol ifAbsent: [ ^ self ].
	global isClassOrTrait ifFalse: [ ^ self ].
	^ aBlock value: global typAsType
]

{ #category : #accessing }
TypInfLocalDefinition >> outReads [
	^ out
		at: #read
		ifPresent: [ :e | e collect: #target ]
		ifAbsent: [ #() ]
]

{ #category : #initialization }
TypInfLocalDefinition >> transfer [
	node isArgumentVariable ifFalse: [ ^ self put: TypNilType instance ].
	self ifFromName: [ :t | ^ self covariantPut: t ].
	self covariantPut: self type
]

{ #category : #initialization }
TypInfLocalDefinition >> type [
	^ (self outReads collect: #type)
		ifEmpty: [ super type ]
		ifNotEmpty: #typAsMinimizedType
]
