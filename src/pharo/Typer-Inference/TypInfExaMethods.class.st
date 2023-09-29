Class {
	#name : #TypInfExaMethods,
	#superclass : #Object,
	#category : #'Typer-Inference-Examples'
}

{ #category : #accessing }
TypInfExaMethods >> block [
	^ [ 1 ] value
]

{ #category : #accessing }
TypInfExaMethods >> block: aBoolean [
	^ aBoolean ifTrue: [ 1 ] ifFalse: [ 0 ]
]

{ #category : #accessing }
TypInfExaMethods >> blockTrue: aBoolean [
	^ aBoolean ifTrue: [ 1 ]
]

{ #category : #accessing }
TypInfExaMethods >> blockUseSameTwice: aBoolean [
	| block |
	block := [ 2 ].
	^ aBoolean ifTrue: block ifFalse: block
]

{ #category : #accessing }
TypInfExaMethods >> constrain: x [
	x blockUseSameTwice: true
]

{ #category : #accessing }
TypInfExaMethods >> deadCode [
	true ifTrue: [ ^ self ].
	^ #dead
]

{ #category : #requirements }
TypInfExaMethods >> empty [
]

{ #category : #accessing }
TypInfExaMethods >> error [
	[ Error new signal ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #requirements }
TypInfExaMethods >> inlined [

	^ self symbol
]

{ #category : #requirements }
TypInfExaMethods >> message [

	^ 1 + 2
]

{ #category : #accessing }
TypInfExaMethods >> signal [
	Error signal
]

{ #category : #accessing }
TypInfExaMethods >> signalAndHandle [
	[ Error new signal ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #accessing }
TypInfExaMethods >> signalInlineAndHandle [
	[ self signal ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #accessing }
TypInfExaMethods >> signalLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypInfExaMethods >> signalLookupAndHandle [
	[ self signalLookup ] on: Error do: [ :e | ^ e ].
	^ #notcaught
]

{ #category : #requirements }
TypInfExaMethods >> symbol [

	^ #symbol
]

{ #category : #accessing }
TypInfExaMethods >> translated [
	^ Array with: 'a' translated with: 'b' translated
]

{ #category : #accessing }
TypInfExaMethods >> typShaMethodSignalLookup: aLookup [
	<typShaMethod: #signalLookup>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {}
		argumentsOptional: false
		signalsAlways: Error typAsType
]

{ #category : #accessing }
TypInfExaMethods >> while2: aBlock [
	^ aBlock whileFalse: [ 'bop' ]
]

{ #category : #accessing }
TypInfExaMethods >> while: aBoolean [
	^ [ aBoolean ] whileFalse: [ 'bop' ]
]
