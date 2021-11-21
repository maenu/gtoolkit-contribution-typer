Class {
	#name : 'TypTyping',
	#superclass : 'Object',
	#classInstVars : [
		'probes'
	],
	#category : 'Typer-Core-Utility'
}

{ #category : 'accessing' }
TypTyping class >> probes [

	^ probes ifNil: [ probes := IdentitySet new ]
]

{ #category : 'accessing' }
TypTyping >> debugTypeMethods [

	<gtExample>
	| methods results |
	results := OrderedCollection new.
	methods := CompiledMethod allInstances.
	1 to: 100 do: [ :i | 
		| method process semaphore |
		method := methods atRandom.
		semaphore := Semaphore new.
		process := [ 
		           [ 
		           [ method typInfTypeIn: method methodClass typAsType ]
			           on: Exception
			           do: [ :e | 
				           e
					           freeze;
					           debug ] ] ensure: [ semaphore signal ] ] fork.
		(semaphore wait: 1000 milliSeconds) ifTrue: [ 
			process suspend.
			results add: process ] ].
	^ results
]

{ #category : 'accessing' }
TypTyping >> memoryProbe [

	<gtExample>
	^ { 
		  Smalltalk vm memorySize.
		  Smalltalk vm statisticsReport.
		  SpaceTally new systemWideSpaceTally }
]

{ #category : 'accessing' }
TypTyping >> monitorMemory [

	<gtExample>
	| probes |
	probes := Dictionary new.
	probes at: 'pre-load' put: self memoryProbe.
	self stressMemory.
	probes at: 'post-load' put: self memoryProbe.
	Smalltalk garbageCollect.
	probes at: 'post-gc' put: self memoryProbe.
	^ probes
]

{ #category : 'accessing' }
TypTyping >> monitorMemory10 [

	<gtExample>
	5 timesRepeat: [ self class probes add: self monitorMemory ].
	^ self class probes
]

{ #category : 'accessing' }
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

{ #category : 'accessing' }
TypTyping >> stressMemory [

	<gtExample>
	| semaphore process |
	semaphore := Semaphore new.
	process := [ 
	           [ 
	           [ TypTyping new typeMethods ]
		           on: Exception
		           do: [ :e | 
			           e
				           freeze;
				           debug ] ] ensure: [ semaphore signal ] ] fork.
	semaphore
		wait: 60 seconds
		onCompletion: [  ]
		onTimeout: [ process terminate ].
	^ nil
]

{ #category : 'accessing' }
TypTyping >> typeAllMethods [
	<gtExample>
	^ [CompiledMethod allInstancesDo: [ :e | 
		(e typInfTypeIn: e methodClass typAsType) ]] timeToRun
]

{ #category : 'accessing' }
TypTyping >> typeMethods [
	<gtExample>
	| methods results |
	results := OrderedCollection new.
	methods := CompiledMethod allInstances.
	1 to: 100 do: [ :i | 
		| method |
		method := methods atRandom.
		results add: (method typInfTypeIn: method methodClass typAsType) ].
	^ results
]
