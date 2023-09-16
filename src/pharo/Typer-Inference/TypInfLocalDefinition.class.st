Class {
	#name : #TypInfLocalDefinition,
	#superclass : #TypInfVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfLocalDefinition >> classOrNil [
	| className global |
	state at: self ifAbsent: [ ^ nil ].
	(state at: self) isUnknown ifFalse: [ ^ nil ].
	(node name beginsWith: 'an')
		ifTrue: [ className := node name allButFirst: 2 ]
		ifFalse: [ (node name beginsWith: 'a')
				ifTrue: [ className := node name allButFirst: 1 ]
				ifFalse: [ ^ false ] ].
	global := Smalltalk globals at: className asSymbol ifAbsent: [ ^ false ].
	global isClassOrTrait ifFalse: [ ^ false ].
	^ global
]

{ #category : #accessing }
TypInfLocalDefinition >> outReads [

	^ out
		  at: #read
		  ifPresent: [ :e | e collect: #target ]
		  ifAbsent: [ #(  ) ]
]

{ #category : #initialization }
TypInfLocalDefinition >> transfer [
	self classOrNil
		ifNotNil: [ :c | 
			self put: c typAsType.
			^ self ].
	state
		at: self
		ifPresent: [ :t | self put: t ]
		ifAbsent: [ self put: self type ]
]

{ #category : #accessing }
TypInfLocalDefinition >> type [
	^ state
		at: self
		ifAbsent: [ (self outReads collect: #type) typAsMinimizedType ]
]
