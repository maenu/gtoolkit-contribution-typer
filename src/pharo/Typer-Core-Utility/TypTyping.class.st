Class {
	#name : 'TypTyping',
	#superclass : 'Object',
	#category : 'Typer-Core-Utility'
}

{ #category : 'accessing' }
TypTyping >> debugTypeMethods [

	<gtExample>
	| methods results |
	results := OrderedCollection new.
	methods := CompiledMethod allInstances.
	1 to: 10 do: [ :i | 
		| method process semaphore |
		method := methods atRandom.
		semaphore := Semaphore new.
		process := [ 
		           method typInfTypeIn: method methodClass typAsType.
		           semaphore signal ] fork.
		(semaphore wait: 2000 milliSeconds) ifTrue: [ 
			process suspend.
			results add: process ] ].
	^ results
]

{ #category : 'accessing' }
TypTyping >> typeMethods [
	<gtExample>
	| methods results |
	results := OrderedCollection new.
	methods := CompiledMethod allInstances.
	1 to: 10 do: [ :i | 
		| method |
		method := methods atRandom.
		results add: (method typInfTypeIn: method methodClass typAsType) ].
	^ results
]
