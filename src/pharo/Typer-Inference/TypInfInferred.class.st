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

{ #category : #accessing }
TypInfInferred >> error [
	[ Error new signal ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #requirements }
TypInfInferred >> inlined [

	^ self symbol
]

{ #category : #requirements }
TypInfInferred >> message [

	^ 1 + 2
]

{ #category : #accessing }
TypInfInferred >> signal [
	Error signal
]

{ #category : #accessing }
TypInfInferred >> signalAndHandle [
	[ Error new signal ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #accessing }
TypInfInferred >> signalInlineAndHandle [
	[ self signal ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #accessing }
TypInfInferred >> signalLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypInfInferred >> signalLookupAndHandle [
	[ self signalLookup ] on: Error do: [ :e | ^ e ].
	^ #notcaught
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
TypInfInferred >> typShaMethodSignalLookup: aLookup [
	<typShaMethod: #signalLookup>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {}
		argumentsOptional: false
		signalsAlways: Error typAsType
]

{ #category : #accessing }
TypInfInferred >> while2: aBlock [
	^ aBlock whileFalse: [ 'bop' ]
]

{ #category : #accessing }
TypInfInferred >> while: aBoolean [
	^ [ aBoolean ] whileFalse: [ 'bop' ]
]
