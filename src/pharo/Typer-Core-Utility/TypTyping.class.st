Class {
	#name : #TypTyping,
	#superclass : #Object,
	#classInstVars : [
		'probes'
	],
	#category : #'Typer-Core-Utility'
}

{ #category : #accessing }
TypTyping class >> probes [

	^ probes ifNil: [ probes := IdentitySet new ]
]

{ #category : #accessing }
TypTyping >> memoryProbe [

	<gtExample>
	^ { 
		  Smalltalk vm memorySize.
		  Smalltalk vm statisticsReport.
		  SpaceTally new systemWideSpaceTally }
]

{ #category : #accessing }
TypTyping >> monitorMemoryAllMethods [

	<gtExample>
	^ self
		  monitorMemoryMethods: CompiledMethod allInstances
		  timeout: 5 seconds
]

{ #category : #accessing }
TypTyping >> monitorMemoryMethods: aCollection timeout: aDuration [

	| probes result tally |
	probes := Dictionary new.
	probes at: 'pre-load' put: self memoryProbe.
	tally := MessageTally on: [ 
		         result := aCollection collect: [ :e | 
			                   self typeMethod: e timeout: aDuration ] ].
	probes at: 'post-load' put: self memoryProbe.
	Smalltalk garbageCollect.
	probes at: 'post-gc' put: self memoryProbe.
	^ { 
		  result.
		  tally.
		  probes }
]

{ #category : #accessing }
TypTyping >> monitorMemorySomeMethods [

	<gtExample>
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 100 ] whileTrue: [ methods add: all atRandom ].
	^ self monitorMemoryMethods: methods timeout: 5 seconds
]

{ #category : #accessing }
TypTyping >> reset [

	<gtExample>
	| probes |
	probes := Dictionary new.
	probes at: 'pre-reset' put: self memoryProbe.
	ASTCache reset.
	TypIndex resetAll.
	TypResolver resetAll.
	TypInfImplementorsCache reset.
	Smalltalk garbageCollect.
	probes at: 'post-reset' put: self memoryProbe.
	self class probes add: probes.
	^ self class probes
]

{ #category : #accessing }
TypTyping >> typeAllMethods [

	<gtExample>
	| methods n d |
	methods := CompiledMethod allInstances.
	n := methods size.
	d := NewValueHolder value: 0.
	[ 
	methods do: [ :e | 
		| result |
		result := self typeMethod: e timeout: 5 seconds.
		d value: d value + (1 / n) ] ] forkNamed: 'typeAllMethods'.
	^ d
]

{ #category : #accessing }
TypTyping >> typeMethod: aMethod timeout: aDuration [

	| semaphore process error timeout result |
	timeout := false.
	semaphore := Semaphore new.
	process := [ 
	           [ 
	           [ 
	           result := aMethod typInfTypeSelf:
		                     aMethod methodClass typAsType ]
		           on: Exception
		           do: [ :e | 
			           e freeze.
			           error := e ] ] ensure: [ semaphore signal ] ] fork.
	semaphore wait: aDuration onCompletion: [  ] onTimeout: [ 
		process suspend.
		timeout := true ].
	timeout ifTrue: [ 
		^ TypMethodMeasurement method: aMethod process: process ].
	error ifNotNil: [ 
		^ TypMethodMeasurement method: aMethod error: error ].
	^ TypMethodMeasurement method: aMethod result: result
]
