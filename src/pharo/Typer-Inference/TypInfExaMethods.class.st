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

{ #category : #accessing }
TypInfExaMethods >> divide: aNumber [
	^ aNumber / aNumber
]

{ #category : #requirements }
TypInfExaMethods >> empty [
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

{ #category : #accessing }
TypInfExaMethods >> signalsMaybe: aDictionary [
	| index |
	index := aDictionary findElementOrNil: 1.
	^ 12
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
TypInfExaMethods >> typShaMethodUnarySignalLookup: aLookup root: anotherLookup [
	<typShaMethod: #signalLookup>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypVoidType instance
		arguments: {}
		argumentsOptional: false
		signalsAlways: Error typAsType
		signalsMaybe: nil
]

{ #category : #accessing }
TypInfExaMethods >> while: aBoolean [
	^ [ aBoolean ] whileFalse: [ 'bop' ]
]
