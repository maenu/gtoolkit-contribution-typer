Class {
	#name : #TypInfInferred,
	#superclass : #Object,
	#category : #'Typer-Inference-Examples'
}

{ #category : #accessing }
TypInfInferred >> block: aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]
]

{ #category : #accessing }
TypInfInferred >> blockUseSameTwice: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
]

{ #category : #requirements }
TypInfInferred >> empty [
]

{ #category : #requirements }
TypInfInferred >> inlined [

	^ self symbol
]

{ #category : #requirements }
TypInfInferred >> message [

	^ 1 + 2
]

{ #category : #requirements }
TypInfInferred >> message2 [

	^ 1 + 7
]

{ #category : #requirements }
TypInfInferred >> message3 [

	^ 1 + 7
]

{ #category : #requirements }
TypInfInferred >> message4 [

	^ 1 + 7
]

{ #category : #requirements }
TypInfInferred >> message5 [

	^ 1 + 7
]

{ #category : #requirements }
TypInfInferred >> message6 [

	^ 1 + 7
]

{ #category : #requirements }
TypInfInferred >> message7 [

	^ 1 + 7
]

{ #category : #requirements }
TypInfInferred >> symbol [

	^ #symbol
]
