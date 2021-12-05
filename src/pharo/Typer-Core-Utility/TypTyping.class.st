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
TypTyping >> invalidate [

	<gtExample>
	| probes |
	probes := OrderedCollection new.
	probes add: 'pre-reset' -> self memoryProbe.
	TypIndex invalidateAll.
	TypInfImplementorsCache invalidate.
	Smalltalk garbageCollect.
	probes add: 'post-reset' -> self memoryProbe.
	^ probes
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
	[ methods size < 1 ] whileTrue: [ methods add: all atRandom ].
	^ self monitorMemoryMethods: methods timeout: 5 seconds
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
		result := self typeMethod: e timeout: 30 seconds.
		d value: d value + (1 / n) ] ] forkNamed: 'typeAllMethods'.
	^ d
]

{ #category : #accessing }
TypTyping >> typeMethod: aMethod timeout: aDuration [

	| start end semaphore process error timeout result |
	start := DateAndTime now.
	timeout := false.
	semaphore := Semaphore new.
	process := [ 
	           [ 
	           [ result := aMethod typInfTypeInSelf ]
		           on: Exception
		           do: [ :e | 
			           (e isKindOf: OCUndeclaredVariableWarning)
				           ifTrue: [ e resume: e declareUndefined ]
				           ifFalse: [ 
					           (e isKindOf: OCShadowVariableWarning)
						           ifTrue: [ e resume ]
						           ifFalse: [ 
							           e freeze.
							           error := e ] ] ] ] ensure: [ semaphore signal ] ]
		           fork.
	semaphore wait: aDuration onCompletion: [  ] onTimeout: [ 
		process suspend.
		timeout := true ].
	end := DateAndTime now.
	timeout ifTrue: [ 
		^ TypMethodMeasurement
			  method: aMethod
			  duration: end - start
			  process: process ].
	error ifNotNil: [ 
		^ TypMethodMeasurement
			  method: aMethod
			  duration: end - start
			  error: error ].
	^ TypMethodMeasurement
		  method: aMethod
		  duration: end - start
		  result: result
]

{ #category : #accessing }
TypTyping >> typeSomeMethods [

	<gtExample>
	| all methods |
	TypIndex invalidateAll.
	TypInfImplementorsCache invalidate.
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3000 ] whileTrue: [ methods add: all atRandom ].
	^ methods asOrderedCollection collect: [ :e | self typeMethod: e timeout: 30 seconds ]
]
