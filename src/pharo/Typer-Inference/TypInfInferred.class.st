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
TypInfInferred >> block2: aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]
]

{ #category : #accessing }
TypInfInferred >> block3: aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]
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
TypInfInferred >> blockUseSameTwice2: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
]

{ #category : #accessing }
TypInfInferred >> blockUseSameTwice3: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
]

{ #category : #accessing }
TypInfInferred >> blockUseSameTwice4: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
]

{ #category : #accessing }
TypInfInferred >> blockUseSameTwice5: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
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

{ #category : #accessing }
TypInfInferred >> translated [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated2 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated3 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated4 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated5 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated6 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated7 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated8 [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfInferred >> translated9 [
	^ Array with: 'a' translated with: 'b' translated
]
