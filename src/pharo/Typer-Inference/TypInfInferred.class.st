Class {
	#name : #TypInfInferred,
	#superclass : #Object,
	#category : #'Typer-Inference-Examples'
}

{ #category : #accessing }
TypInfInferred >> block [
	^ [ 1 ] value
]

{ #category : #accessing }
TypInfInferred >> block: aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]
]

{ #category : #accessing }
TypInfInferred >> blockTrue: aBoolean [
	^ aBoolean ifTrue: [ 1 ]
]

{ #category : #accessing }
TypInfInferred >> blockUseSameTwice: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
]

{ #category : #accessing }
TypInfInferred >> constrain: x [
	x blockUseSameTwice: true
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
TypInfInferred >> symbol [

	^ #symbol
]

{ #category : #accessing }
TypInfInferred >> translated [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> while2: aBlock [
	^ aBlock whileFalse: [ 'bop' ]
]

{ #category : #accessing }
TypInfInferred >> while: aBoolean [
	^ [ aBoolean ] whileFalse: [ 'bop' ]
]
