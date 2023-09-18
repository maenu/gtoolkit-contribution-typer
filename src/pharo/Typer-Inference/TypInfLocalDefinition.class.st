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
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ (node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ self covariantPut: TypUnknownType instance ] ].
	global := Smalltalk globals
			at: className asSymbol
			ifAbsent: [ ^ self covariantPut: TypUnknownType instance ].
	global isClassOrTrait ifFalse: [ ^ self covariantPut: TypUnknownType instance ].
	self covariantPut: global typAsType
]

{ #category : #accessing }
TypInfLocalDefinition >> type [
	^ (self outReads collect: #type) typAsMinimizedType
]
